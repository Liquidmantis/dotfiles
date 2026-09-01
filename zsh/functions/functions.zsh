function search-abbreviations() {
  $(abbr | fzf | awk '{split($0,a,"\""); print a[4]}')
}

function notes() {
  pushd ~/notes >/dev/null
  vi blotter.md
  popd >/dev/null
}

function set-tokens() {
  export HOMEBREW_GITHUB_API_TOKEN="$(op read "op://Private/GitHub Personal Access Token/token")"
  export GITHUB_TOKEN="$(op read "op://Private/GitHub Personal Access Token/token")"
  export BOBSHELL_API_KEY="$(op read "op://Private/BobShell API Key/credential")"
}

function opencode-plugin-update() {
  emulate -L zsh
  setopt pipefail

  local config=""
  local check_only=0
  local -a requested

  while (($#)); do
    case "$1" in
    --config)
      shift
      if ((!$#)); then
        print -u2 -- "opencode-plugin-update: --config requires a path"
        return 2
      fi
      config="$1"
      ;;
    --check)
      check_only=1
      ;;
    -h | --help)
      print -- "usage: opencode-plugin-update [--config PATH] [--check] [PACKAGE ...]"
      return 0
      ;;
    --)
      shift
      requested+=("$@")
      break
      ;;
    -*)
      print -u2 -- "opencode-plugin-update: unknown option: $1"
      return 2
      ;;
    *)
      requested+=("$1")
      ;;
    esac
    shift
  done

  if [[ -z "$config" ]]; then
    local config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
    if [[ -f "$config_dir/opencode.jsonc" ]]; then
      config="$config_dir/opencode.jsonc"
    elif [[ -f "$config_dir/opencode.json" ]]; then
      config="$config_dir/opencode.json"
    else
      print -u2 -- "opencode-plugin-update: no standard OpenCode config found"
      return 1
    fi
  fi

  config="${config/#\~/$HOME}"
  config="${config:a}"
  if [[ ! -f "$config" ]]; then
    print -u2 -- "opencode-plugin-update: config not found: $config"
    return 1
  fi

  local command_name
  for command_name in opencode jq npm node; do
    if ! command -v "$command_name" >/dev/null; then
      print -u2 -- "opencode-plugin-update: required command not found: $command_name"
      return 1
    fi
  done

  local debug_config
  if ! debug_config=$(OPENCODE_DISABLE_PROJECT_CONFIG=1 OPENCODE_CONFIG="$config" opencode debug config); then
    print -u2 -- "opencode-plugin-update: failed to load $config"
    return 1
  fi

  local specs_output
  specs_output=$(print -r -- "$debug_config" | jq -r --arg config "$config" '
    (.plugin_origins // [])[]
    | select(.source == $config)
    | .spec
    | select((startswith("file://") or startswith(".") or startswith("/")) | not)
  ')

  if [[ -z "$specs_output" ]]; then
    print -- "No npm plugins configured in $config"
    return 0
  fi

  local -a specs
  specs=("${(@f)specs_output}")

  print -- "Config: $config"

  local cache_root="${XDG_CACHE_HOME:-$HOME/.cache}/opencode/packages"
  local spec package_name latest cache_spec cache_dir installed manifest metadata
  local new_spec target_cache target_manifest arg
  local processed=0
  local updated=0
  local failed=0
  local wanted
  local -A matched

  for spec in "${specs[@]}"; do
    if ! metadata=$(npm view "$spec" name --json 2>/dev/null); then
      print -u2 -- "Failed to query package metadata: $spec"
      ((failed++))
      continue
    fi
    package_name=$(print -r -- "$metadata" | jq -r 'if type == "array" then .[-1] else . end // empty')
    if [[ -z "$package_name" ]]; then
      print -u2 -- "Could not determine package name: $spec"
      ((failed++))
      continue
    fi

    wanted=1
    if ((${#requested})); then
      wanted=0
      for arg in "${requested[@]}"; do
        if [[ "$arg" == "$spec" || "$arg" == "$package_name" ]]; then
          matched[$arg]=1
          wanted=1
        fi
      done
    fi
    ((wanted)) || continue
    ((processed++))

    if ! latest=$(npm view "$package_name" dist-tags.latest --json 2>/dev/null | jq -r 'if type == "array" then .[-1] else . end // empty'); then
      print -u2 -- "Failed to query latest version: $package_name"
      ((failed++))
      continue
    fi
    if [[ -z "$latest" ]]; then
      print -u2 -- "No latest version published: $package_name"
      ((failed++))
      continue
    fi

    if [[ "$spec" == "$package_name" ]]; then
      cache_spec="$package_name@latest"
    else
      cache_spec="$spec"
    fi
    cache_dir="$cache_root/$cache_spec"
    manifest="$cache_dir/node_modules/$package_name/package.json"
    installed="not cached"
    if [[ -f "$manifest" ]]; then
      installed=$(jq -r '.version // "unknown"' "$manifest")
    fi

    if [[ "$installed" == "$latest" ]]; then
      printf '%s: %s (up to date)\n' "$package_name" "$installed"
      continue
    fi

    printf '%s: %s -> %s\n' "$package_name" "$installed" "$latest"
    ((check_only)) && continue

    if [[ "$spec" == "$package_name" || "$spec" == "$package_name@latest" ]]; then
      new_spec="$spec"
      target_cache="$cache_root/$package_name@latest"
    else
      new_spec="$package_name@$latest"
      target_cache="$cache_root/$new_spec"
    fi

    mkdir -p "$target_cache" || {
      print -u2 -- "Failed to create cache directory: $target_cache"
      ((failed++))
      continue
    }
    if ! npm install \
      --prefix "$target_cache" \
      --ignore-scripts \
      --save-exact \
      --no-audit \
      --no-fund \
      "$package_name@$latest"; then
      print -u2 -- "Failed to install $package_name@$latest"
      ((failed++))
      continue
    fi

    target_manifest="$target_cache/node_modules/$package_name/package.json"
    if [[ ! -f "$target_manifest" ]] || [[ "$(jq -r '.version // empty' "$target_manifest")" != "$latest" ]]; then
      print -u2 -- "Installed package failed verification: $package_name@$latest"
      ((failed++))
      continue
    fi

    if [[ "$new_spec" != "$spec" ]]; then
      if ! node - "$config" "$spec" "$new_spec" <<'NODE'; then
const fs = require("fs")

const [file, oldSpec, newSpec] = process.argv.slice(2)
const source = fs.readFileSync(file, "utf8")
const needle = JSON.stringify(oldSpec)
const replacement = JSON.stringify(newSpec)
const matches = source.split(needle).length - 1

if (matches !== 1) {
  throw new Error(`expected one ${needle} entry in ${file}, found ${matches}`)
}

const temp = `${file}.tmp.${process.pid}`
const mode = fs.statSync(file).mode
fs.writeFileSync(temp, source.replace(needle, replacement), { mode })
fs.renameSync(temp, file)
NODE
        print -u2 -- "Installed $new_spec but failed to update $config"
        ((failed++))
        continue
      fi
    fi

    print -- "Updated $package_name to $latest"
    ((updated++))
  done

  for arg in "${requested[@]}"; do
    if [[ -z "${matched[$arg]-}" ]]; then
      print -u2 -- "Plugin is not configured in $config: $arg"
      ((failed++))
    fi
  done

  if ((!processed && !failed)); then
    print -- "No matching npm plugins configured in $config"
  elif ((!check_only)); then
    print -- "Updated: $updated"
  fi

  ((failed == 0))
}

function proj() {
  _dir=$(fd --full-path --type d | fzf)

  pushd ~/git-work/${_dir} >/dev/null
}

function daily-note() {
  pushd ~/notes >/dev/null
  timestamp=$(date +"%Y-%m-%d")
  yesterday=$(date -v-1d +"%Y-%m-%d")
  tomorrow=$(date -v+1d +"%Y-%m-%d")
  zk new daily \
    --extra=yesterday=$yesterday,tomorrow=$tomorrow \
    --no-input \
    --print-path
  popd >/dev/null
}

function mkdir-and-cd() {
  mkdir -p $1
  cd $1
}

function push-with-zoxide() {
  pushd $(zoxide query $1)
}

function set-aws-profile() {
  export AWS_PROFILE=$(aws configure list-profiles | fzf)
}

function _workspace_select() {
  tf_command=$1
  workspace="$(eval $tf_command workspace list | fzf | sed 's/\*//' | tr -d ' ')"
  if [[ -n "$workspace" ]]; then
    eval $tf_command workspace select $workspace
  fi
}

function asdf_terraform_workspace_select() {
  _workspace_select "asdf exec terraform"
}
alias atws=asdf_terraform_workspace_select

function terraform_workspace_select() {
  _workspace_select "terraform"
}
alias tws=terraform_workspace_select

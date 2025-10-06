function search-abbreviations() {
  $(abbr | fzf | awk '{split($0,a,"\""); print a[4]}')
}

function notes() {
  pushd ~/notes >/dev/null
  vi inbox.md
  popd >/dev/null
}

function set-tokens() {
  export HOMEBREW_GITHUB_API_TOKEN="$(op item get GitHub\ Personal\ Access\ Token --reveal --fields token)"
  export GITHUB_TOKEN="$(op item get GitHub\ Personal\ Access\ Token --reveal --fields token)"
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

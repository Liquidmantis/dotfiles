function hcloud-select-stack() {
  all_flag=false
  setenv_flag=false

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --all|-a)
        all_flag=true
        shift
        ;;
      --setenv|-s)
        setenv_flag=true
        shift
        ;;
      *)
        echo "Unknown option: $1"
        return 1
        ;;
      esac
  done

  if $all_flag; then
    stacks=$(cat "${HOME}/.config/hcloud/hashistack/config.yaml" | yq '.environments | to_entries | .[].key')
  else
    stacks="$(hcloud hashistack list --format=json | jq -r '.[].stack')" 
  fi

  stack="$(echo $stacks | fzf-tmux -p)"

  if $setenv_flag; then
    export STACK=$stack
  else
    echo $stack
  fi
}

function hcloud-connect-stack() {
  if [[ -n $1 ]]; then
    stack=$1
  elif [[ -n $STACK ]]; then
    stack=$STACK
  else
    stack=$(hcloud-select-stack -a)
  fi
  if [[ -z $stack ]]; then
    return 1
  fi
  echo "Connecting to $stack..."
  hcloud hashistack vpn $stack
  echo "Setting environment variables..."
  eval $(hcloud hashistack env $stack)
  echo "Setting Vault addresses..."
  set-vault-addresses init
}

function set-vault-addresses() {
  case "$1" in
    "init") 
      local vault_addr="$VAULT_ADDR"

      export VAULT_ADDR_INITIAL="$vault_addr"
      export VAULT_ADDR_APP="$vault_addr"

      local protocol=$(echo "$vault_addr" | sed -E 's|^(https?)://.*|\1|')
      local hostname=$(echo "$vault_addr" | sed -E 's|https?://([^/]+).*|\1|')
      local infra_hostname="infra-$hostname"
      local infra_vault_addr="$protocol://$infra_hostname"

      export VAULT_ADDR_INFRA="$infra_vault_addr"
    ;;

    "app")
      export VAULT_ADDR="$VAULT_ADDR_APP"
    ;;

    "infra")
      export VAULT_ADDR="$VAULT_ADDR_INFRA"
    ;;

    "reset")
      export VAULT_ADDR="$VAULT_ADDR_INITIAL"
    ;;

    *) 
      echo "Invalid argument. Please use 'init', 'reset', 'app', or 'infra'."
    ;;
  esac
}

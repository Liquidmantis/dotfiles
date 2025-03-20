function hcloud-connect-stack() {
  if [[ $# -eq 0 ]]; then
    type="hashistack"
  elif [[ "$1" = "hashistack" ]]; then
    type="hashistack"
  elif [[ "$1" = "pproxy" ]]; then
    type="pproxy"
  else
    echo "Unknown connection type: $1.  Expected 'hashistack' or 'pproxy'."
    return 1
  fi

  if [[ "$type" = "hashistack" ]]; then
    stack=$(select-stack hashistack)
    if [[ -z "$stack" ]]; then
      echo "No stack selected. Aborting."
      return
    fi
    export HCLOUD_STACK=$stack
    connect-hashistack $stack
  elif [[ "$type" = "pproxy" ]]; then
    stack=$(select-stack pproxy)
    if [[ -z "$stack" ]]; then
      echo "No stack selected. Aborting."
      return
    fi
    export HCLOUD_STACK=$stack
    connect-pproxy
  else
    echo "Unknown type: $type"
    return 1
  fi

}

local function select-stack() {
  type=$1
  if [[ "$type" = "hashistack" ]]; then
    stacks=$(cat "${HOME}/.config/hcloud/hashistack/config.yaml" | yq '.environments | to_entries | .[].key')
    # Currently not using the built in hashistack list because it is an incomplete list
    # stacks="$(hcloud hashistack list --format=json | jq -r '.[].stack')"
  elif [[ "$type" = "pproxy" ]]; then
    stacks=$(cat "${HOME}/.config/hcloud/pproxy/config.yaml" | yq '.environments | to_entries | .[].key')
  else
    return 1
  fi

  stack="$(echo $stacks | fzf-tmux -p)"
  echo $stack
}

local function connect-hashistack() {
  echo "Connecting to $stack..."
  hcloud hashistack vpn $stack
  echo "Setting environment variables..."
  eval $(hcloud hashistack env $stack)
  echo "Setting Vault addresses..."
  set-vault-addresses init
}

local function connect-pproxy() {
  echo "Setting pproxy addresses..."
  set-pproxy-addresses
  # echo "Starting pproxy in the background..."
  # hcloud pproxy serve &
  # sleep 1
  # echo "-----------------------------------"
  # echo "pproxy running in the background.  Logs will stream to your terminal."
  # echo "To restore pproxy, run 'fg'."
}

local function set-pproxy-addresses() {
  export VAULT_ADDR="http://vault.${HCLOUD_STACK}.pproxy.local"
  export CONSUL_ADDR="http://consul.${HCLOUD_STACK}.pproxy.local"
  export NOMAD_ADDR="http://nomad.${HCLOUD_STACK}.pproxy.local"
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

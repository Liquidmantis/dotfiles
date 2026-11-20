function hcloud-connect-stack() {
  select-stack
  if [[ -z "$HCLOUD_STACK" ]]; then
    log ERROR "No stack selected."
    return 1
  fi
  letmein

  connect-hashistack $stack
}

local function select-stack() {
  local stack_list selected_stack aws_account
  log INFO "Getting stacks..."
  stack_list=$(hcloud hashistack list --format json | jq -r '.[].[] | "\(.name)\t\(.aws_account)"')
  selected_stack=$(echo "$stack_list" | cut -f1 | fzf --prompt="Select stack: ")
  if [[ -z "$selected_stack" ]]; then
    log ERROR "No stack selected."
    return 1
  fi
  aws_account=$(echo "$stack_list" | awk -F'\t' -v stack="$selected_stack" '$1 == stack {print $2}')
  if [[ -z "$aws_account" ]]; then
    log ERROR "No AWS account found for stack: $selected_stack"
    return 2
  fi

  export HCLOUD_STACK=$selected_stack
  export HCLOUD_AWS_ACCOUNT=$aws_account
}

local function letmein() {
  log INFO "Refreshing Doormat credentials..."
  doormat login

#  echo -n "Enter justification: "
#  read justification < /dev/tty
#  if [[ -z "$justification" ]]; then
#    log ERROR "Justification is required."
#    return 3
#  fi
  # alternatively comment out the block above and uncomment this fixed value.
  justification="job responsibilities"

  hcloud letmein "$HCLOUD_AWS_ACCOUNT" --justification "$justification" --access-level "developer"
}

local function connect-hashistack() {
  log INFO "Connecting to $HCLOUD_STACK..."
  hcloud hashistack connect $HCLOUD_STACK
  log INFO "Setting environment variables..."
  eval $(hcloud hashistack env $HCLOUD_STACK)
  log INFO "Setting extra Vault addresses..."
  set-vault-addresses init
  log INFO "Getting access tokens"
  get-tokens
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

local function get-tokens() {
  local vault_role="cloud-infra-services"
  local consul_role="cloud-admin"
  local nomad_role="_cloud-super-admin"
  eval $(hcloud hashistack tokens \
  --vault-role $vault_role \
  --consul-role $consul_role \
  --nomad-role $nomad_role \
  --format env_vars)
}

local function log() {
  local level="${1:-INFO}"
  shift

  local color reset='\033[0m'

  case "$level" in
    INFO)  color='\033[36m' ;; # cyan
    WARN)  color='\033[33m' ;; # yellow
    ERROR) color='\033[31m' ;; # red
    DEBUG) color='\033[90m' ;; # gray
    *)     color='\033[0m'  ;;
  esac

  printf '[%s] %b%-5s%b %s\n' \
    "$(date '+%H:%M:%S')" \
    "$color" "$level" "$reset" "$*"
}

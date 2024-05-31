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
    stacks=$(grep 'Host ' ${HOME}/.ssh/config.d/hashistack | awk '{print $2}' | sed 's/-bastion//g' | grep -v '^\*$' | sort)
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
}

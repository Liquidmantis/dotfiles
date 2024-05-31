function tmux-attach-session() {
  if [[ -z "$1" ]]; then
    $1 = "main"
  fi
  if [[ -n $TMUX ]]; then
    if [[ $(tmux has-session -t $1) ]]; then
      tmux switch-client -t $1 
    else
      tmux new-session -s $1 -d
      tmux switch-client -t $1
    fi
    return
  fi
  if [[ $(pgrep tmux) ]]; then
    if [[ $(tmux list-session | grep ^$1) ]]; then
      tmux attach -t $1
    else
      tmux new-session -s $1
    fi
  else
    tmux new-session -s $1
  fi
}

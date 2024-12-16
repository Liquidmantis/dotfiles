function tmux-attach-session() {
  if [[ -z "$1" ]]; then
    1="main"
  fi
  if [[ -n $TMUX ]]; then
    echo "Already in a tmux session"
    if [[ $(tmux has-session -t $1) ]]; then
      echo "Attaching to session $1"
      tmux switch-client -t $1
    else
      echo "Creating new session $1"
      tmux new-session -s $1 -d
      tmux switch-client -t $1
    fi
    return
  fi
  if [[ $(pgrep tmux) ]]; then
    echo "Found tmux process"
    if [[ $(tmux list-session | grep ^$1) ]]; then
      tmux attach -t $1
    else
      tmux new-session -s $1
    fi
  else
    echo "Starting new tmux session"
    tmux new-session -s $1
  fi
}

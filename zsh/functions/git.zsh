function git-ignore() {
  echo "$1" >>.gitignore
}

function git-log() {
  git log --color=always --pretty=format:"%C(yellow)%h %C(red)%ad %C(blue)%an%C(auto)%d %Creset%s" --date=short --graph $1 |
    bat --decorations=never
}

function git-log-preview() {
  git-log $1 | fzf --bind 'enter:execute(echo {2})+abort' --ansi --preview 'git show --color=always {2}'
}

function git-file-history() {
  fzf --bind 'enter:execute(echo {2})+abort' --ansi --preview \
    'git log --color=always --pretty=format:"%C(yellow)%h %C(red)%ad %C(blue)%an%C(auto)%d %Creset%s" --date=short --graph {1}'
}

function git-stash-preview() {
  git stash list | fzf --bind 'enter:abort' --ansi --preview 'awk "{print substr({1},8,1)}" | git stash show -- -p --color=always'
}

function git-switch-search() {
  case $1 in
  "remote")
    branches="$(git branch --remote)"
    ;;
  "all")
    branches="$(git branch --all)"
    ;;
  *)
    branches="$(git branch)"
    ;;
  esac
  branch="$(echo $branches |
    egrep -v "(dependabot)" |
    fzf --ansi --preview \
      'git log --color=always --pretty=format:"%C(yellow)%h %C(red)%ad %C(blue)%an%C(auto)%d %Creset%s" --date=short --graph {1}' |
    sed 's|^*||' |
    tr -d '[:space:]')"
  # awk -F'/' '{print $NF}' |

  git switch $branch
}

function git-branch-merged-delete() {
  case $1 in
  "remote")
    git branch --remote --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -dr
    return
    ;;
  *)
    git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d
    return
    ;;
  esac
}

function git-branch-orphans() {
  case $1 in
  "list-only")
    git fetch -p
    git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}'
    return
    ;;
  "delete")
    git fetch -p
    git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
    return
    ;;
  esac
}

function git-update-submodules() {
  git submodule update --init --recursive --remote --rebase
}

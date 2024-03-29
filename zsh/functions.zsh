# make space autoexpand aliases
# maybe consider https://github.com/simnalamburt/zsh-expand-all
# function expand-alias() {
# 	zle _expand_alias
# 	zle self-insert
# }
# zle -N expand-alias
# bindkey -M main ' ' expand-alias

function search-abbreviations() {
  $(abbr | fzf | awk '{split($0,a,"\""); print a[4]}')
}

function notes() {
  pushd ~/notes > /dev/null
  vi index.md 
  popd > /dev/null
}

function wiki() {
  pushd ~/notes > /dev/null
  vi index.md
  popd > /dev/null
}

function proj() {
  _dir=$(fd --full-path --type d | fzf) 

  pushd ~/git-work/${_dir} > /dev/null
}

function daily-note() {
  pushd ~/notes > /dev/null
  timestamp=$(date +"%Y-%m-%d")
  yesterday=$(date -v-1d +"%Y-%m-%d")
  tomorrow=$(date -v+1d +"%Y-%m-%d")
  zk new daily \
    --extra=yesterday=$yesterday,tomorrow=$tomorrow \
    --no-input \
    --print-path
  popd > /dev/null
}

function mkdir-and-cd() {
  mkdir -p $1
  cd $1
}

function push-with-zoxide() {
  pushd $(zoxide query $1)
}

function git-log() {
  git log --color=always --pretty=format:"%C(yellow)%h %C(red)%ad %C(blue)%an%C(auto)%d %Creset%s" --date=short --graph
}

function git-log-preview() {
  git-log | fzf --bind 'enter:execute(echo {2})+abort' --ansi --preview 'git show --color=always {2}'
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
    "all")
      git switch "$(git branch --all | egrep -v "(dependabot)" | fzf | tr -d '[:space:]')"
      return
      ;;
    *)
      git switch "$(git branch | fzf --ansi --preview  'git-log {1}' | tr -d '[:space:]')"
      return
  esac
}

function git-delete-merged() {
  case $1 in
    "remote")
      git branch --remote --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -dr
      return
      ;;
    *)
      git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d
      return
  esac
}

function git-delete-orphans() {
  case $1 in
    "list-only")
      git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}'
      return
      ;;
    *)
      git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
      return
  esac
}

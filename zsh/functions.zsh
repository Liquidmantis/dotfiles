# make space autoexpand aliases
# maybe consider https://github.com/simnalamburt/zsh-expand-all
function expand-alias() {
	zle _expand_alias
	zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

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
  zk new \
    --group=daily \
    --extra=yesterday=$yesterday,tomorrow=$tomorrow \
    --no-input \
    --print-path
  popd > /dev/null
}

function mk-and-cd() {
  mkdir $1
  cd $1
}
alias mc="mk-and-cd"

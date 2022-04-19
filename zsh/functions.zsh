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
  vi $args
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

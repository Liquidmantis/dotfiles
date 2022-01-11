function notes() {
  pushd ~/notes > /dev/null
  vi
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

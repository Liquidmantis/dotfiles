# add named directories
hash -d gh=~/git-home
hash -d gw=~/git-work
hash -d df=~/git-home/dotfiles

# app aliases
alias ci='code-insiders'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias edit='nvim'
alias pp='pwsh-preview -nologo'
alias ps='pwsh -nologo'

# terraform aliases
alias tf='terraform'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfg='tf graph | dot -Tpng > tfgraph.png && open tfgraph.png'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfw='terraform workspace'
alias tfws='terraform workspace select'
alias tfwl='terraform workspace list'

# docker aliases
alias doc='docker'
alias docc='docker container'
alias doci='docker image'

# git aliases
alias g='git'
alias gp='git push'
alias gpl='git pull'
alias gc='git checkout'
alias gb='git checkout -b'
 
# dotfile edit aliases
alias via='edit ~/.config/alacritty/alacritty.yml'
alias vial='edit ~/.config/zsh/aliases.zsh'
alias vif='edit ~/.config/zsh/functions.zsh'
alias vih='edit ~/.hammerspoon/init.lua'
alias vik='edit ~/.config/kitty/kitty.conf'
alias vit='edit ~/.tmux.conf'
alias viv='edit ~/.config/nvim/init.lua'
alias viy='edit ~/.yabairc'
alias viz='edit ~/.zshrc'

# terminal mojo aliases
alias h=history
alias ls='exa'
alias ll='exa -al'
alias ld='exa -al --sort newest'
alias soal='source ~/.config/zsh/aliases'
alias soz='source ~/.zshrc'

# command aliases
alias brewup='brew update; brew upgrade --fetch-HEAD; brew upgrade --cask; brew cleanup'
alias yabres='brew services stop yabai && brew services start yabai'
alias yabrestart='brew services stop yabai && brew services start yabai'

# any aliases below here were added via echo append and need sorting

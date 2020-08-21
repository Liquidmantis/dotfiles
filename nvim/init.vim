source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim

" neovim settings
if !exists('g:vscode')
	source $HOME/.config/nvim/plug-config/coc.vim
	source $HOME/.config/nvim/plug-config/fzf.vim
	source $HOME/.config/nvim/plug-config/airline.vim
	source $HOME/.config/nvim/plug-config/coc-explorer.vim
	source $HOME/.config/nvim/plug-config/vimwiki.vim
	source $HOME/.config/nvim/keybindings.vim
endif

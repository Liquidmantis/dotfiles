source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim

" neovim settings
if !exists('g:vscode')
	source $HOME/.config/nvim/plug-config/coc.vim
	source $HOME/.config/nvim/plug-config/fzf.vim
	source $HOME/.config/nvim/plug-config/fzf.vim
	source $HOME/.config/nvim/keybindings.vim
	autocmd VimResized * :wincmd =
	source $HOME/.config/nvim/coc-explorer.vim
	source $HOME/.config/nvim/vimwiki.vim
	let mapleader="\<space>"
    set number relativenumber
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set smartindent
	set incsearch
	set nocompatible
	set hidden
	set termguicolors
	syntax on
endif


call plug#begin('~/.vim/plugged')
" global oplugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'PProvost/vim-ps1' 
Plug 'justinmk/vim-sneak'
Plug 'rizzatti/dash.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'vimwiki/vimwiki'

" vscode-neovim exclusive plugins
if exists('g:vscode')
    Plug 'asvetliakov/vim-easymotion', { 'dir' : '~/.vim/plugged/vscode/vim-easymotion' }
endif

" neovim exclusive plugins
if !exists('g:vscode')
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim'
    Plug 'yatli/coc-powershell'
    Plug 'easymotion/vim-easymotion', { 'dir' : '~/.vim/plugged/neovim/vim-easymotion' }
	Plug 'morhetz/gruvbox'
	Plug 'jremmen/vim-ripgrep'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-utils/vim-man'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'
	Plug 'mbbill/undotree'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'mhinz/vim-startify'
	" Plug 'hashivim/vim-terraform'
	Plug 'voldikss/vim-floaterm'
endif
call plug#end()

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

" global settings
set undodir=~/.vim/undodir
set undofile

filetype on
" adjust vim-commentary standard comment style
autocmd FileType Powershell setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s
" autocmd FileType ps1 setlocal commentstring=#\ %s

colorscheme gruvbox
set background=dark

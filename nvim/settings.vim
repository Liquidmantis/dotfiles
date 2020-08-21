" global settings
set undodir=~/.vim/undodir
set undofile

filetype on

let mapleader="\<space>"

" adjust vim-commentary standard comment style
autocmd FileType Powershell setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s

" settings out of VSCode
if !exists('g:vscode')
	autocmd VimResized * :wincmd =
	colorscheme gruvbox
	set background=dark
	
    set number relativenumber
	
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab

    set smartindent
	set showmatch
	set incsearch
	set hidden
	set termguicolors
	syntax on
endif

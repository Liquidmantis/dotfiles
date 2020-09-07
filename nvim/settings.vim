" global settings
set undodir=~/.vim/undodir
set undofile

filetype plugin indent on

let mapleader="\<space>"

" adjust vim-commentary standard comment style
autocmd FileType Powershell setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s

" settings out of VSCode
if !exists('g:vscode')
    " ###############################
    " Airline Settings
    set showtabline=2
    set noshowmode " remove default mode indicators
    " ###############################
    " CoC Settings
    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300
    set shortmess+=c " Don't pass messages to |ins-completion-menu|.
    " ###############################

    autocmd VimResized * :wincmd =
    colorscheme gruvbox
    set background=dark

    set number relativenumber

    set tabstop=2 softtabstop=2
    set shiftwidth=2
    set expandtab

    set foldmethod=indent         " default manual fold is painful
    set foldlevelstart=1          " autofold on open to reinforce fold usage
    set smartindent
    set showmatch
    set incsearch
    set hidden
    set termguicolors
    syntax on
endif

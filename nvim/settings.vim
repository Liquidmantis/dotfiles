" global settings
set splitright
set splitbelow
set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup
set nowritebackup


filetype plugin indent on
let mapleader="\<space>"

" adjust vim-commentary standard comment style
autocmd FileType Powershell setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s

" settings out of VSCode
if !exists('g:vscode')
    " Airline Settings
    set showtabline=2
    set noshowmode " remove default mode indicators

    set cmdheight=2

    set completeopt=menuone,longest
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=50
    " set shortmess+=c " Don't pass messages to |ins-completion-menu|.

    autocmd VimResized * :wincmd =
    colorscheme gruvbox
    set background=dark

    set number relativenumber
    set cursorline                " highlight active line
    set colorcolumn=80
    highlight ColorColumn ctermbg=0 guibg=Green

    set tabstop=2 softtabstop=2
    set shiftwidth=2
    set expandtab
    set smartindent

    set foldmethod=indent         " default manual fold is painful
    set foldlevel=9
    set showmatch                 " flash matching brackets
    set incsearch                  
    set hidden
    set termguicolors
    set scrolloff=5
    syntax on
endif

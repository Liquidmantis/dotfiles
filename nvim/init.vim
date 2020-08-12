call plug#begin('~/.vim/plugged')
" global oplugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'PProvost/vim-ps1' 
Plug 'justinmk/vim-sneak'
Plug 'rizzatti/dash.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'christoomey/vim-tmux-navigator'

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
	Plug 'kien/ctrlp.vim'
	" Plug 'ycm-core/YouCompleteMe'
	Plug 'mbbill/undotree'
endif
call plug#end()

" neovim settings
if !exists('g:vscode')
    set number relativenumber
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set smartindent
	set incsearch
	nnoremap <leader>h :wincmd h<CR>
	nnoremap <leader>l :wincmd l<CR>
	nnoremap <leader>j :wincmd j<CR>
	nnoremap <leader>k :wincmd k<CR>
	nnoremap <leader>- :split-window<CR>
	nnoremap <leader>\ :vsplit-window<CR>
	nnoremap <leader>! :wincmd _<CR>:wincmd \|<CR>
	nnoremap <leader>= :wincmd =<CR>
	autocmd VimResized * :wincmd =
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
let mapleader=" "

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
	Plug 'mbbill/undotree'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'mhinz/vim-startify'
	Plug 'hashivim/vim-terraform'
endif
call plug#end()

" neovim settings
if !exists('g:vscode')
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
	
	" TODO: organize these into something sensible
	nnoremap <silent> <leader>h :wincmd h<CR>
	nnoremap <silent> <leader>l :wincmd l<CR>
	nnoremap <silent> <leader>j :wincmd j<CR>
	nnoremap <silent> <leader>k :wincmd k<CR>
	nnoremap <silent> <leader>- :split<CR>
	nnoremap <silent> <leader>\ :vsplit<CR>
	nnoremap <silent> <leader>! :wincmd _<CR>:wincmd \|<CR> " break buffer to new window
	nnoremap <silent> <leader>= :wincmd =<CR>
	nnoremap <leader>bb :ls<cr>:b<space>
	nnoremap <leader>bv :ls<cr>:vert sb<space>
	nnoremap <leader>bs :ls<cr>:sb<space>
	nnoremap <silent> <leader>ej :CocCommand explorer<CR> " trying a faster mapping - 'j' for left side
	nnoremap <silent> <leader>ef :CocCommand explorer --preset floating<CR>
	nnoremap <silent> <leader>viv :tabedit $MYVIMRC<CR>
	nnoremap <silent> <leader>sov :source $MYVIMRC<CR> | echo 'Reloaded neovim config.'
	nnoremap <silent> <leader>hl :noh<CR> " clear last search highlight

	nnoremap <silent> <leader>u :UndotreeToggle<CR>
	autocmd VimResized * :wincmd =
	source $HOME/.config/nvim/coc-explorer.vim
	source $HOME/.config/nvim/vimwiki.vim
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

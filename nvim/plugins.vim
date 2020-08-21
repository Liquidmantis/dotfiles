call plug#begin('~/.vim/plugged')
" global plugins
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
	Plug 'hashivim/vim-terraform'
	Plug 'voldikss/vim-floaterm'
	Plug 'vim-airline/vim-airline'
endif
call plug#end()

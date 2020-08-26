call plug#begin('~/.vim/plugged')
" global plugins
Plug 'chaoren/vim-wordmotion'
Plug 'justinmk/vim-sneak'
Plug 'PProvost/vim-ps1'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

" vscode-neovim exclusive plugins
if exists('g:vscode')
    Plug 'asvetliakov/vim-easymotion', { 'dir' : '~/.vim/plugged/vscode/vim-easymotion' }
endif

" neovim exclusive plugins
if !exists('g:vscode')
    Plug 'airblade/vim-rooter'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'easymotion/vim-easymotion', { 'dir' : '~/.vim/plugged/neovim/vim-easymotion' }
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'hashivim/vim-terraform'
    Plug 'jremmen/vim-ripgrep'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/gv.vim'
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-signify'
    Plug 'morhetz/gruvbox'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'neoclide/coc.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'preservim/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'
    Plug 'voldikss/vim-floaterm'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-utils/vim-man'
    Plug 'yatli/coc-powershell'
endif
call plug#end()

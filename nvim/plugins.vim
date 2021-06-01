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
    " Telescope and prereqs
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " Git utilities
    Plug 'rhysd/git-messenger.vim' 
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'

    Plug 'lambdalisue/fern.vim'
    " makes fzf search from the git project root rather than local dir.  Honors .gitignore
    Plug 'airblade/vim-rooter' 
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'easymotion/vim-easymotion', { 'dir' : '~/.vim/plugged/neovim/vim-easymotion' }
    Plug 'hashivim/vim-terraform'
    Plug 'jremmen/vim-ripgrep'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/gv.vim'
    Plug 'kmonad/kmonad-vim'
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'
    Plug 'gruvbox-community/gruvbox'
    Plug 'hrsh7th/nvim-compe'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-abolish'
    Plug 'voldikss/vim-floaterm'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-utils/vim-man'
  endif
call plug#end()

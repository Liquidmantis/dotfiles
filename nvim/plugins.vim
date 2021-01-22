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
      Plug 'ncm2/ncm2'                      " nvim completion manager
      " Plug 'neovim/nvim-lspconfig'
      " Plug 'liquidmantis/nvim-lspconfig'
      Plug 'nvim-treesitter/nvim-treesitter'
      Plug 'preservim/nerdtree'
      Plug 'sheerun/vim-polyglot'
      Plug 'tmsvg/pear-tree'
      Plug 'tpope/vim-fugitive'
      Plug 'tpope/vim-abolish'
      Plug 'voldikss/vim-floaterm'
      Plug 'vim-airline/vim-airline'
      Plug 'vim-utils/vim-man'
      Plug 'yatli/coc-powershell'
  endif
call plug#end()

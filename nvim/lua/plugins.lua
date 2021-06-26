return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use 'tjdevries/nlua.nvim'
  use 'chaoren/vim-wordmotion'
  use 'justinmk/vim-sneak'
  use 'PProvost/vim-ps1'
  use 'rizzatti/dash.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'vimwiki/vimwiki'

  -- Telescope and prereqs
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- use 'neoclide/coc.nvim'
  
  -- Git utilities
  use 'rhysd/git-messenger.vim' 
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'

  use 'lambdalisue/fern.vim'
  use 'lambdalisue/fern-git-status.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- makes fzf search from the git project root rather than local dir.  Honors .gitignore
  use 'airblade/vim-rooter' 
  use 'christoomey/vim-tmux-navigator'
  use 'easymotion/vim-easymotion' --, dir = '~/.vim/plugged/neovim/vim-easymotion' }
  use 'hashivim/vim-terraform'
  use 'jremmen/vim-ripgrep'
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
  use 'junegunn/gv.vim'

  use 'kmonad/kmonad-vim'

  use 'mbbill/undotree'
  use 'mhinz/vim-startify'
  -- use 'gruvbox-community/gruvbox'
  use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}} 

  use 'hrsh7th/nvim-compe'
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use 'tpope/vim-abolish'
  use 'voldikss/vim-floaterm'
  -- use 'vim-airline/vim-airline'
  use 'glepnir/galaxyline.nvim'
  use 'vim-utils/vim-man'
end)

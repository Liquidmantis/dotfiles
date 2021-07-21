return require('packer').startup(function()

  -- Packer plugin manager self manages
  use 'wbthomason/packer.nvim'

  -- Extra movements and objects
  use 'chaoren/vim-wordmotion'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Testing/Learning plugins
  use 'sindrets/diffview.nvim'
  use 'akinsho/nvim-toggleterm.lua'

  -- Chopping block plugins
  use 'rizzatti/dash.vim'
  -- use 'mhinz/vim-startify' -- never really used, but could be useful with setup.
  -- use 'gruvbox-community/gruvbox' -- replacing with a lua version
  -- use 'glepnir/galaxyline.nvim' -- replacing with lualine
  -- use 'tpope/vim-abolish' -- never used
  -- use 'voldikss/vim-floaterm' -- replacing with toggleterm
  -- use 'justinmk/vim-sneak'  -- replacing with hop

  -- Vim features add-ons
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'vimwiki/vimwiki'
  use 'christoomey/vim-tmux-navigator'
  use 'jremmen/vim-ripgrep'
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
  use 'junegunn/gv.vim'
  use 'mbbill/undotree'
  use 'hoob3rt/lualine.nvim'
  use 'vim-utils/vim-man'
  use 'szw/vim-maximizer'
  use 'famiu/bufdelete.nvim'

  -- Telescope and prereqs
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Language add-ons
  use 'PProvost/vim-ps1'
  use 'JayDoubleu/vim-pwsh-formatter'
  use 'hashivim/vim-terraform'
  use 'kmonad/kmonad-vim' -- lisp, really, I guess
  use 'tjdevries/nlua.nvim'
  use 'hrsh7th/nvim-compe'
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Git utilities
  use 'rhysd/git-messenger.vim' 
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'
  use 'airblade/vim-rooter' -- makes fzf search from the git project root rather than local dir.  Honors .gitignore

  -- Themes
  use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}} 
  use 'sainnhe/everforest'

end)

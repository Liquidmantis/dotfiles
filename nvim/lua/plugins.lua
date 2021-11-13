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
  use 'ggandor/lightspeed.nvim'

  -- Testing/Learning plugins
  use 'sindrets/diffview.nvim'
  use 'akinsho/nvim-toggleterm.lua'

  -- Vim features add-ons
  use 'norcalli/nvim-colorizer.lua'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'vimwiki/vimwiki'
  use 'christoomey/vim-tmux-navigator'
  use 'jremmen/vim-ripgrep'
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
  use 'junegunn/gv.vim'
  use 'mbbill/undotree'
  use 'nvim-lualine/lualine.nvim'
  use 'vim-utils/vim-man'
  use 'szw/vim-maximizer'
  use 'famiu/bufdelete.nvim' -- close buffer without messing up windows
  use 'wfxr/minimap.vim'
  use 'luukvbaal/stabilize.nvim'
  require("stabilize").setup()
  -- use 'Pocco81/TrueZen.nvim'
  use 'folke/zen-mode.nvim'
  use 'folke/trouble.nvim'
  use 'folke/todo-comments.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'ThePrimeagen/harpoon'

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
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  -- use 'glepnir/lspsaga.nvim'
  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  use 'L3MON4D3/LuaSnip'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'folke/lua-dev.nvim'
  use 'lepture/vim-jinja'

  -- Git utilities
  use 'rhysd/git-messenger.vim' 
  use 'tpope/vim-fugitive'
  -- use 'mhinz/vim-signify'
  use 'lewis6991/gitsigns.nvim'
  -- use 'airblade/vim-rooter' -- makes fzf search from the git project root rather than local dir.  Honors .gitignore
  use { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end }
  require('telescope').load_extension('projects')

  -- Themes
  use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}} 
  use 'sainnhe/everforest'

end)

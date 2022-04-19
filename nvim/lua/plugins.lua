return require('packer').startup(function()

  -- Packer plugin manager self manages
  use 'wbthomason/packer.nvim'

  -- Extra movements and objects
  use 'chaoren/vim-wordmotion'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'ggandor/lightspeed.nvim'
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
  -- use 'akinsho/nvim-toggleterm.lua'

  -- Vim features add-ons
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}
  use 'stevearc/dressing.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'rcarriga/nvim-notify'
  use 'norcalli/nvim-colorizer.lua'  -- highlight color references with the color
  -- use 'kyazdani42/nvim-tree.lua'     -- file explorer
  use 'nvim-neo-tree/neo-tree.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'renerocksai/telekasten.nvim'
  -- use '~/git-home/telekasten.nvim'
  use 'renerocksai/calendar-vim'
  use 'christoomey/vim-tmux-navigator'
  use 'jremmen/vim-ripgrep'
  use 'sunjon/Shade.nvim'
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
  use 'junegunn/gv.vim'
  use 'mbbill/undotree'            -- the awesome undo history explorer
  use 'nvim-lualine/lualine.nvim'  -- statusbar
  use 'vim-utils/vim-man'
  use 'szw/vim-maximizer'    -- zoom/maximize current pane
  use 'famiu/bufdelete.nvim' -- close buffer without messing up windows
  use 'wfxr/minimap.vim'
  use 'luukvbaal/stabilize.nvim'
  require("stabilize").setup()
  use 'folke/zen-mode.nvim'
  use 'folke/trouble.nvim'
  use 'folke/todo-comments.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'ThePrimeagen/harpoon'
  use 'nvim-neorg/neorg'
  use 'nvim-neorg/neorg-telescope'
  use 'AckslD/nvim-neoclip.lua'

  -- Telescope and prereqs
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Language add-ons
  use 'fatih/vim-go'
  use 'ray-x/go.nvim'
  use 'PProvost/vim-ps1'
  use 'JayDoubleu/vim-pwsh-formatter'
  use 'hashivim/vim-terraform'
  use 'tjdevries/nlua.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use { 'tami5/lspsaga.nvim' }
  -- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/playground'}
  use 'folke/lua-dev.nvim'
  use 'lepture/vim-jinja'
  use 'ckipp01/stylua-nvim'

  -- Git utilities
  use 'rhysd/git-messenger.vim'
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'
  use 'lewis6991/gitsigns.nvim'
  use 'airblade/vim-rooter' -- makes fzf search from the git project root rather than local dir.  Honors .gitignore
  use { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end }
  require('telescope').load_extension('projects')

  -- -- Themes
  use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
  use 'sainnhe/everforest'

end)

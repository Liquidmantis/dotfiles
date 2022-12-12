return require('packer').startup(function(use)
  -- Packer plugin manager self manages
  use 'wbthomason/packer.nvim'

  -- Extra movements and objects
  use 'chaoren/vim-wordmotion'          -- adds CamelCase wordmotions
  use 'numToStr/Comment.nvim'           -- comment toggling 
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'ggandor/leap.nvim'
  use 'ggandor/flit.nvim'

  -- Testing/Learning plugins
  use 'sindrets/diffview.nvim'
  use { "nvim-neorg/neorg", run = ":Neorg sync-parsers" }
  -- use 'akinsho/nvim-toggleterm.lua'

  -- Vim features add-ons
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}
  use 'stevearc/dressing.nvim'          -- UI improvements
  use 'MunifTanjim/nui.nvim'            -- UI components
  use 'rcarriga/nvim-notify'            -- Notifications UI 
  use 'norcalli/nvim-colorizer.lua'     -- highlight color references with the color
  use 'nyngwang/murmur.lua'             -- cursor word highlighting
  -- use 'glacambre/firenvim'              -- FireNvim browser add-on
  use 'kyazdani42/nvim-tree.lua'        -- file explorer
  -- use 'nvim-neo-tree/neo-tree.nvim'
  use 'kyazdani42/nvim-web-devicons'
  -- use 'renerocksai/telekasten.nvim'
  -- use 'renerocksai/calendar-vim'
  use 'christoomey/vim-tmux-navigator'
  use 'jremmen/vim-ripgrep'
  use 'mickael-menu/zk-nvim'
  use 'sunjon/Shade.nvim'
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'                -- support for fzf
  use 'junegunn/gv.vim'                 -- git commit browser
  use 'mbbill/undotree'                 -- the awesome undo history explorer
  use 'nvim-lualine/lualine.nvim'       -- statusbar
  -- use 'vim-utils/vim-man'
  use 'szw/vim-maximizer'               -- zoom/maximize current pane
  use 'famiu/bufdelete.nvim'            -- close buffer without messing up windows
  use 'gorbit99/codewindow.nvim'        -- minimap
  use 'pocco81/true-zen.nvim'
  use 'folke/trouble.nvim'
  use 'folke/twilight.nvim'             -- highlight focused code blocks
  use 'folke/todo-comments.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'ThePrimeagen/harpoon'
  use 'AckslD/nvim-neoclip.lua'

  -- Telescope, prereqs, and extensions
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'axieax/urlview.nvim'             -- sophisticated picker for links in page
  use 'nvim-neorg/neorg-telescope'

  -- Language add-ons
  -- use 'fatih/vim-go'
  use 'ray-x/go.nvim'
  use 'PProvost/vim-ps1'
  use 'JayDoubleu/vim-pwsh-formatter'
  use 'hashivim/vim-terraform'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'neovim/nvim-lspconfig'
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    },
  }
  use 'glepnir/lspsaga.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'folke/neodev.nvim'
  use 'lepture/vim-jinja'
  use 'ckipp01/stylua-nvim'

  -- Git utilities
  use 'rhysd/git-messenger.vim'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  -- use 'airblade/vim-rooter' -- makes fzf search from the git project root rather than local dir.  Honors .gitignore
  use { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end }
  require('telescope').load_extension('projects')

  -- -- Themes
  use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
  use 'sainnhe/everforest'
  use { "catppuccin/nvim", as = "catppuccin" }

end)

return {
  -- Extra movements and objects
  -- Testing/Learning plugins

  --  UI add-ons
    'stevearc/dressing.nvim',
    'MunifTanjim/nui.nvim',             -- UI components
    'rcarriga/nvim-notify',             -- Notifications UI 

  -- Vim features add-ons
    {'kevinhwang91/nvim-bqf', ft = 'qf'}, -- better quickfix
    'NvChad/nvim-colorizer.lua',        -- highlight color references with the color
    'nyngwang/murmur.lua',              -- cursor word highlighting
    'kyazdani42/nvim-tree.lua',         -- file explorer
    'kyazdani42/nvim-web-devicons',
    'zbirenbaum/copilot.lua',
    'zbirenbaum/copilot-cmp',
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "canary",
      dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      },
      opts = {
        debug = false, -- Enable debugging
        -- See Configuration section for rest
      },
      -- See Commands section for default commands if you want to lazy load on them
    },
    'mattdibi/incolla.nvim',            -- paste images into markdown
    'jremmen/vim-ripgrep',
    'epwalsh/obsidian.nvim',
    'sunjon/Shade.nvim',
    'junegunn/fzf',
    'junegunn/fzf.vim',                 -- support for fzf
    'junegunn/gv.vim',                  -- git commit browser
    'mbbill/undotree',                  -- the awesome undo history explorer
    '0x00-ketsu/maximizer.nvim',                -- zoom/maximize current pane
    'famiu/bufdelete.nvim',             -- close buffer without messing up windows
    'gorbit99/codewindow.nvim',         -- minimap
    'pocco81/true-zen.nvim',
    'folke/noice.nvim',
    'folke/trouble.nvim',
    'folke/twilight.nvim',              -- highlight focused code blocks
    'folke/todo-comments.nvim',
    'lukas-reineke/indent-blankline.nvim',
    {'ThePrimeagen/harpoon', branch = 'harpoon2'},
    'AckslD/nvim-neoclip.lua',

  -- Debugging
    'nvim-neotest/nvim-nio',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    'leoluz/nvim-dap-go', -- not needed with ray-x/go.nvim
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    {
      'nvim-neotest/neotest',
      dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-neotest/neotest-go',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter'
      }
    },

  -- Telescope, prereqs, and extensions
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
      'kkharji/sqlite.lua' }},
    'axieax/urlview.nvim',             -- sophisticated picker for links in page
    'nvim-neorg/neorg-telescope',
--
  -- Language add-ons
    'kmonad/kmonad-vim',
    { 'ray-x/go.nvim', dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    'PProvost/vim-ps1',
    'JayDoubleu/vim-pwsh-formatter',
    'hashivim/vim-terraform',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'williamboman/mason.nvim',
    'j-hui/fidget.nvim',
    'neovim/nvim-lspconfig',
    { 'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
  },
    'nvimdev/lspsaga.nvim',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    'nvim-treesitter/playground',
    'folke/neodev.nvim',
    'lepture/vim-jinja',
    'ckipp01/stylua-nvim',
    'habamax/vim-godot',

  -- Git utilities
    'rhysd/git-messenger.vim',
    'lewis6991/gitsigns.nvim',
    { "FabijanZulj/blame.nvim", config = function() require("blame").setup() end },
  --   'airblade/vim-rooter', -- makes fzf search from the git project root rather than local dir.  Honors .gitignore
    { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end },

  -- Themes
    {'npxbr/gruvbox.nvim', dependencies = {'rktjmp/lush.nvim'}},
    'sainnhe/everforest',
    { "catppuccin/nvim", name = "catppuccin" }
}

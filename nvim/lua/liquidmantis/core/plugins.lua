return {
  -- Extra movements and objects
    'chaoren/vim-wordmotion',            -- adds CamelCase wordmotions
    'numToStr/Comment.nvim',             -- comment toggling 
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'ggandor/leap.nvim',
    'ggandor/flit.nvim',
--
  -- Testing/Learning plugins
    'sindrets/diffview.nvim',
  --   { "nvim-neorg/neorg", run = ":Neorg sync-parsers" }
--
  --  UI add-ons
    'stevearc/aerial.nvim',
    'stevearc/dressing.nvim',
    'MunifTanjim/nui.nvim',             -- UI components
    'rcarriga/nvim-notify',             -- Notifications UI 
--
  -- Vim features add-ons
    {'kevinhwang91/nvim-bqf', ft = 'qf'}, -- better quickfix
    'NvChad/nvim-colorizer.lua',        -- highlight color references with the color
    'nyngwang/murmur.lua',              -- cursor word highlighting
    'kyazdani42/nvim-tree.lua',         -- file explorer
    'kyazdani42/nvim-web-devicons',
    'christoomey/vim-tmux-navigator',
    -- 'github/copilot.vim',
    'zbirenbaum/copilot.lua',
    'zbirenbaum/copilot-cmp',
    -- 'gptlang/copilotchat.nvim',
    -- { "jellydn/CopilotChat.nvim", branch = "canary", opts = { mode = "split" }, },
    -- 'CopilotC-Nvim/CopilotChat.nvim',
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
    -- 'mickael-menu/zk-nvim',
    'epwalsh/obsidian.nvim',
    'sunjon/Shade.nvim',
    'junegunn/fzf',
    'junegunn/fzf.vim',                 -- support for fzf
    'junegunn/gv.vim',                  -- git commit browser
    'mbbill/undotree',                  -- the awesome undo history explorer
    'nvim-lualine/lualine.nvim',        -- statusbar
--   'vim-utils/vim-man',
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

  -- Telescope, prereqs, and extensions
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    { 'nvim-telescope/telescope-frecency.nvim', dependencies = {
      'kkharji/sqlite.lua' }},
    { 'nvim-telescope/telescope-fzf-native.nvim', dependencies = {
      'junegunn/fzf',
      'junegunn/fzf.vim',
    }, build = 'make' },
    'axieax/urlview.nvim',             -- sophisticated picker for links in page
    'nvim-neorg/neorg-telescope',
--
  -- Language add-ons
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
    'glepnir/lspsaga.nvim',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    'nvim-treesitter/playground',
    'folke/neodev.nvim',
    'lepture/vim-jinja',
    'ckipp01/stylua-nvim',
--
    'habamax/vim-godot',
--
  -- Git utilities
    -- 'rhysd/git-messenger.vim',
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
  --   'airblade/vim-rooter', -- makes fzf search from the git project root rather than local dir.  Honors .gitignore
    { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end },
--
  -- -- Themes
    {'npxbr/gruvbox.nvim', dependencies = {'rktjmp/lush.nvim'}},
    'sainnhe/everforest',
    { "catppuccin/nvim", name = "catppuccin" }
--
}

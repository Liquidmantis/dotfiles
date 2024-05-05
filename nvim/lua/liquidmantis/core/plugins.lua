return {
  -- Vim features add-ons
    {'kevinhwang91/nvim-bqf', ft = 'qf'}, -- better quickfix
    'mattdibi/incolla.nvim',            -- paste images into markdown
    'jremmen/vim-ripgrep',
    'epwalsh/obsidian.nvim',
    'junegunn/fzf',
    'junegunn/fzf.vim',                 -- support for fzf
    'junegunn/gv.vim',                  -- git commit browser
    '0x00-ketsu/maximizer.nvim',                -- zoom/maximize current pane
    'famiu/bufdelete.nvim',             -- close buffer without messing up windows
    'pocco81/true-zen.nvim',
    'folke/trouble.nvim',
    'folke/twilight.nvim',              -- highlight focused code blocks
    'folke/todo-comments.nvim',
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
    'kkharji/sqlite.lua',
    'nvim-neorg/neorg-telescope',
--
  -- Language add-ons
    'kmonad/kmonad-vim',
    'PProvost/vim-ps1',
    'JayDoubleu/vim-pwsh-formatter',
    'hashivim/vim-terraform',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'williamboman/mason.nvim',
    'j-hui/fidget.nvim',
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

return {
  -- Vim features add-ons
    {'kevinhwang91/nvim-bqf', ft = 'qf'}, -- better quickfix
    'mattdibi/incolla.nvim',            -- paste images into markdown
    'jremmen/vim-ripgrep',
    'junegunn/fzf',
    'junegunn/fzf.vim',                 -- support for fzf
    'junegunn/gv.vim',                  -- git commit browser
    'famiu/bufdelete.nvim',             -- close buffer without messing up windows
    'pocco81/true-zen.nvim',
    'folke/trouble.nvim',
    'folke/twilight.nvim',              -- highlight focused code blocks
    {'ThePrimeagen/harpoon', branch = 'harpoon2'},

  -- Language add-ons
    'kmonad/kmonad-vim',
    'PProvost/vim-ps1',
    'JayDoubleu/vim-pwsh-formatter',
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
    { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end },
}

return {
  -- Vim features add-ons
    'mattdibi/incolla.nvim',            -- paste images into markdown
    'jremmen/vim-ripgrep',
    'junegunn/gv.vim',                  -- git commit browser
    'famiu/bufdelete.nvim',             -- close buffer without messing up windows
    'folke/trouble.nvim',
    'folke/twilight.nvim',              -- highlight focused code blocks

  -- Language add-ons
    'kmonad/kmonad-vim',
    'PProvost/vim-ps1',
    'JayDoubleu/vim-pwsh-formatter',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'j-hui/fidget.nvim',
    'lepture/vim-jinja',
    'ckipp01/stylua-nvim',
    'habamax/vim-godot',

  -- Git utilities
    'rhysd/git-messenger.vim',
    { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end },
}

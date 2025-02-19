return {
  -- TODO: Figure out which of these plugins to keep
  -- Vim features add-ons
  'mattdibi/incolla.nvim', -- paste images into markdown
  -- 'junegunn/gv.vim',         -- git commit browser
  'famiu/bufdelete.nvim',  -- close buffer without messing up windows
  'folke/trouble.nvim',
  'folke/twilight.nvim',   -- highlight focused code blocks

  -- Language add-ons
  -- 'kmonad/kmonad-vim',
  -- 'PProvost/vim-ps1',
  -- 'JayDoubleu/vim-pwsh-formatter',
  'lepture/vim-jinja',
  'ckipp01/stylua-nvim',
  'habamax/vim-godot',

  -- Git utilities
  -- { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { } end },
  event = "VeryLazy",
}

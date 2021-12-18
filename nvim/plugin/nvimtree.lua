require('nvim-tree').setup {
  disable_netrw   = true,
  hijack_netrw    = true,

  auto_close      = true,
  filters = {
    custom = { '.git', '.gitattributes', '.node_modules' }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ingore_list = {},
    gitignore = true
  },
}
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_create_in_closed_folder = 1


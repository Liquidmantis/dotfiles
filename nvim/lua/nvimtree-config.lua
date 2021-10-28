require('nvim-tree').setup {
  disable_netrw   = true,
  hijack_netrw    = true,
  auto_close      = true,
}
vim.g.nvim_tree_ignore = { '.git' }
vim.g.nvim_tree_gitignore = 1


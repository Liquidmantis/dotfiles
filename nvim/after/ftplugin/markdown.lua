-- enables Obsidian plugin to add additional syntax
-- https://github.com/epwalsh/obsidian.nvim/issues/286
vim.opt.conceallevel = 2

-- Force 2-space indentation for markdown
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

local autosaver = vim.api.nvim_create_augroup("Autosaver", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  pattern = "*.md",
  command = "silent! update",
  group = autosaver
})

require("quarto").activate()
-- enables Obsidian plugin to add additional syntax
-- https://github.com/epwalsh/obsidian.nvim/issues/286
vim.opt.conceallevel = 2

local autosaver = vim.api.nvim_create_augroup("Autosaver", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  pattern = "*",
  command = "silent! w",
  group = autosaver
})


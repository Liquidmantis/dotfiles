-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

local detect_filetypes = vim.api.nvim_create_augroup("Detect filetype", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.pkr.hcl", "*.pkr*.hcl" },
  callback = function()
    vim.bo.filetype = "packer"
  end,
  group = detect_filetypes,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.p8", "*.p8lua" },
  callback = function()
    vim.bo.filetype = "pico8"
  end,
  group = detect_filetypes,
})

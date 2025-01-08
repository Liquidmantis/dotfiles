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

local packer_ft = vim.api.nvim_create_augroup("Packer filetype", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.pkr.hcl", "*.pkr*.hcl" },
  callback = function()
    vim.bo.filetype = "packer"
  end,
  group = packer_ft
})

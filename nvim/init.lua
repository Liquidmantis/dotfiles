local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " "

require('lazy').setup('liquidmantis.core.plugins', {
  defaults = { lazy = false },
  checker = { enabled = true },
})

require('liquidmantis.core.autocommands')
require('liquidmantis.core.settings')
require('liquidmantis.core.keybindings')
require('liquidmantis.core.globals')

require('liquidmantis.core.theme')

require('liquidmantis.plugins.cmp')
require('liquidmantis.plugins.codewindow')
require('liquidmantis.plugins.colorizer')
require('liquidmantis.plugins.comment')
require('liquidmantis.plugins.gitsigns')
require('liquidmantis.plugins.harpoon')
require('liquidmantis.plugins.indent')
require('liquidmantis.plugins.leap')
require('liquidmantis.plugins.lspsaga')
require('liquidmantis.plugins.luasnip')
require('liquidmantis.plugins.nvim-lspconfig')
require('liquidmantis.plugins.murmur')
require('liquidmantis.plugins.neoclip')
-- require('liquidmantis.plugins.neorg')
require('liquidmantis.plugins.nvimtree')
require('liquidmantis.plugins.nvim-notify')
require('liquidmantis.plugins.telescope')
require('liquidmantis.plugins.telescope-functions')
require('liquidmantis.plugins.todocomments')
require('liquidmantis.plugins.treesitter')
require('liquidmantis.plugins.urlview')
require('liquidmantis.plugins.truezen')
-- require('liquidmantis.plugins.zenmode')
require('liquidmantis.plugins.zk-nvim')

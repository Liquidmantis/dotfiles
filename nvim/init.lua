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

--  pulled out here because it needs to be set before lazy loads
vim.g.mapleader = " "
vim.g.maplocalleader = "|"

require('lazy').setup('liquidmantis.plugins', {
  defaults = { lazy = false },
  checker = { enabled = true },
})

require('liquidmantis.core.autocommands')
require('liquidmantis.core.settings')
require('liquidmantis.core.keymaps')
require('liquidmantis.core.globals')
require('liquidmantis.core.theme')

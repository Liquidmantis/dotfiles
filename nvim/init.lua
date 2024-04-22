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

require('lazy').setup('liquidmantis.core.plugins', {
  defaults = { lazy = false },
  checker = { enabled = true },
})

require('liquidmantis.core.autocommands')
require('liquidmantis.core.settings')
require('liquidmantis.core.keymaps')
require('liquidmantis.core.globals')

-- require('liquidmantis.core.theme')

require('liquidmantis.plugins.aerial')
require('liquidmantis.plugins.catppuccin')
require('liquidmantis.plugins.cmp')
require('liquidmantis.plugins.codewindow')
require('liquidmantis.plugins.colorizer')
require('liquidmantis.plugins.copilot')
require('liquidmantis.plugins.copilot-chat')
require('liquidmantis.plugins.comment')
require('liquidmantis.plugins.dressing')
require('liquidmantis.plugins.gitsigns')
require('liquidmantis.plugins.harpoon')
-- require('liquidmantis.plugins.indent')
require('liquidmantis.plugins.leap')
require('liquidmantis.plugins.lspsaga')
-- require('liquidmantis.plugins.lualine')
require('liquidmantis.plugins.luasnip')
require('liquidmantis.plugins.nvim-lspconfig')
require('liquidmantis.plugins.murmur')
require('liquidmantis.plugins.maximizer')
require('liquidmantis.plugins.neoclip')
require('liquidmantis.plugins.neotest')
require('liquidmantis.plugins.nvim-notify')
require('liquidmantis.plugins.noice')
require('liquidmantis.plugins.nvimtree')
require('liquidmantis.plugins.nvim-dap')
require('liquidmantis.plugins.obsidian')
require('liquidmantis.plugins.telescope')
require('liquidmantis.plugins.telescope-functions')
require('liquidmantis.plugins.todocomments')
require('liquidmantis.plugins.treesitter')
require('liquidmantis.plugins.urlview')
require('liquidmantis.plugins.truezen')
require('liquidmantis.plugins.vim-test')

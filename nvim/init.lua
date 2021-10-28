require('packer-config')
require('plugins')
require('settings')

vim.cmd('source $HOME/.config/nvim/plug-config/vim-terraform.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/vimwiki.vim')

require('keybindings')
require('cmp-config')
-- require('galaxyline-config') -- trying lualine instead
require('nvimtree-config')
require('colorizer-config')
require('nvim-lspconfig')
require('gitsigns-config')
require('indent-config')
require('telescope-config')
require('todocomments-config')
require('treesitter-config')
require('lspsaga-config')
-- require('truezen-config')
-- require('lua-lsp') -- commented out because nlua config replaces this (?)
require('theme')
require('zenmode-config')


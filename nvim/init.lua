require('packer-config')
require('plugins')
require('settings')

-- source $HOME/.config/nvim/plug-config/coc.vim
-- source $HOME/.config/nvim/plug-config/coc-explorer.vim
-- source $HOME/.config/nvim/plug-config/fzf.vim
vim.cmd('source $HOME/.config/nvim/plug-config/vim-terraform.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/vimwiki.vim')


require('keybindings')
require('compe-config')
-- require('galaxyline-config') -- trying lualine instead
require('nvim-tree-config')
require('nvim-lspconfig')
require('telescope-config')
require('treesitter-config')
require('lspsaga-config')
require('theme')

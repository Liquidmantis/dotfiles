local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require('plugins')
require('settings')

-- source $HOME/.config/nvim/plug-config/coc.vim
-- source $HOME/.config/nvim/plug-config/coc-explorer.vim
-- source $HOME/.config/nvim/plug-config/fzf.vim
vim.cmd('source $HOME/.config/nvim/plug-config/vim-terraform.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/vimwiki.vim')


require('keybindings')
require('compe-config')
-- require('fern')
require('nvim-lspconfig')
require('telescope-config')
require('treesitter-config')
require('lspsaga-config')

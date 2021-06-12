lua require('plugins')
lua require('settings')
" source $HOME/.config/nvim/settings.vim

source $HOME/.config/nvim/plug-config/airline.vim
" source $HOME/.config/nvim/plug-config/coc.vim
" source $HOME/.config/nvim/plug-config/coc-explorer.vim
source $HOME/.config/nvim/plug-config/fern.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/vim-terraform.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim

source $HOME/.config/nvim/keybindings.vim

lua require('compe-config')
lua require('nvim-lspconfig')
lua require('telescope-config')
lua require('treesitter-config')
lua require('lspsaga-config')

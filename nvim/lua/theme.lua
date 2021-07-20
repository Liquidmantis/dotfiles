require('lualine').setup {
  options = { 
    theme = 'everforest',
    component_separators = {'', ''},
    section_separators = {'\u{E0C6}', '\u{E0C7}'},
  }
}


vim.g.colorscheme = everforest
vim.o.background = 'dark'
vim.cmd([[ colorscheme everforest ]])

local cat = require('catppuccin')

cat.setup({
  transparent_background = true,
  integrations = {
    nvimtree = {
      transparent_panel = true,
    },
  }
})

vim.cmd([[ colorscheme catppuccin ]])

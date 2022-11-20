require('telescope').setup{
  extensions = {
    fzf = {
    }
  },
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    mappings = {
      n = {
        ['<C-S-d>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<C-S-d>'] = require('telescope.actions').delete_buffer
      }
    },
  },
}
require('telescope').load_extension('fzf')

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
  }
}
require('telescope').load_extension('fzf')

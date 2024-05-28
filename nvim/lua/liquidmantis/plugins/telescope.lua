return {
  { 'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function() 
      require('telescope').setup({
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
        },
        extensions = {
          frecency = {
            default_workspace = 'CWD',
          }
        },
        pickers = {
          buffers = {
            mappings = {
              n = {
                ['<C-S-d>'] = require('telescope.actions').delete_buffer
              },
              i = {
                ['<C-S-d>'] = require('telescope.actions').delete_buffer
              }
            },
          },
          live_grep = {
            mappings = {
              i = {
                ['<C-f>'] = require('telescope.actions').to_fuzzy_refine
              },
            },
          },
          oldfiles = {
            only_cwd = true,
          },
        },
      })
    end
  },

  { 'nvim-telescope/telescope-frecency.nvim', 
    dependencies = {
      'kkharji/sqlite.lua'
    }
  },

  { 'nvim-telescope/telescope-fzf-native.nvim',
    dependencies = {
      'junegunn/fzf',
      'junegunn/fzf.vim',
    }, 
    build = 'make'
  }

  -- require('telescope').load_extension('frecency')
  -- require('telescope').load_extension('fzf')
  -- require('telescope').load_extension('notify')
  -- require('telescope').load_extension('projects')
}

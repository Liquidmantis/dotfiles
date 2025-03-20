return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
      require('telescope').load_extension('fzf')
    end
  },

  {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    require("telescope").setup {},
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  -- require('telescope').load_extension('notify')
  -- require('telescope').load_extension('projects')
}

local languages = {
  'bash',
  'comment',
  'go',
  'gomod',
  'gosum',
  'gotmpl',
  'gowork',
  'hcl',
  'http',
  'html',
  'javascript',
  'jq',
  'json',
  'json5',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'sql',
  'ssh_config',
  'terraform',
  'tmux',
  'vim',
  'yaml',
}

local textobject_modes = { 'n', 'x', 'o' }
local select_modes = { 'x', 'o' }

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local plugin_runtime = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/runtime'
      if not vim.tbl_contains(vim.opt.runtimepath:get(), plugin_runtime) then
        vim.opt.runtimepath:prepend(plugin_runtime)
      end

      local treesitter = require('nvim-treesitter')

      treesitter.setup {}

      vim.api.nvim_create_autocmd('FileType', {
        pattern = languages,
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      vim.treesitter.language.register('hcl', 'packer')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        move = {
          set_jumps = false,
        },
        select = {
          lookahead = true,
        },
      }

      vim.keymap.set(textobject_modes, ']b', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@code_cell.inner', 'textobjects')
      end, { desc = 'next code block' })

      vim.keymap.set(textobject_modes, '[b', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@code_cell.inner', 'textobjects')
      end, { desc = 'previous code block' })

      vim.keymap.set(select_modes, 'ib', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@code_cell.inner', 'textobjects')
      end, { desc = 'in block' })

      vim.keymap.set(select_modes, 'ab', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@code_cell.outer', 'textobjects')
      end, { desc = 'around block' })

      vim.keymap.set('n', '<leader>sbl', function()
        require('nvim-treesitter-textobjects.swap').swap_next('@code_cell.outer')
      end, { desc = 'swap next code block' })

      vim.keymap.set('n', '<leader>sbh', function()
        require('nvim-treesitter-textobjects.swap').swap_previous('@code_cell.outer')
      end, { desc = 'swap previous code block' })
    end,
  },
}

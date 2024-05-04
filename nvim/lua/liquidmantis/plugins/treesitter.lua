return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground'
  },

  config = function()
    -- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

    require'nvim-treesitter.configs'.setup {
      ensure_installed = { 
        "bash",
        "go",
        "http",
        "html",
        "javascript",
        "lua",
        "python",
        "terraform",
      }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      ignore_install = {
        "astro",
        "beancount",
        "clojure",
        "julia",
        "phpdoc",
        "kotlin",
        "ruby",
      }, -- List of parsers to ignore installing
      highlight = {
        enable = true,              -- false will disable the whole extension
      }
    },

    require "nvim-treesitter.configs".setup {
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      }
    }
  end
}

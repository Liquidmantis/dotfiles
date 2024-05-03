return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvimtree').setup({
      auto_reload_on_write = true,
      -- disable_netrw   = true,
      hijack_netrw    = true,
      respect_buf_cwd = true,
      -- sync_root_with_cwd = true,

      filters = {
        custom = { '.git', '.gitattributes', '.node_modules' }
      },
      update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
      },

      renderer = {
        highlight_opened_files = "all",
        icons = {
          git_placement = "signcolumn",
        },
      },

      view = {
        number = true,
        relativenumber = true,
        signcolumn = "yes",
      },

      diagnostics = {
        enable = true,
        show_on_dirs = true
      }
    })
  end
}  

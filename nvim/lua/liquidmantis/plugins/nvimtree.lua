local installed, nvimtree = pcall(require, 'nvim-tree')
if not installed then
  vim.notify('nvimtree not installed', 'error')
  return
end

nvimtree.setup({
  auto_reload_on_write = true,
  -- disable_netrw   = true,
  hijack_netrw    = true,

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
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },

  diagnostics = {
    enable = true,
    show_on_dirs = true
  }
})

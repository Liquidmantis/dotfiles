require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Load all the defaults
    ["core.keybinds"] = { 
      config = {
        default_keybinds = true
      }
    },
    ["core.integrations.telescope"] = {}, -- Enable the telescope module
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
      }
    },
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          notes = "~/notes"
        }
      }
    }
  },

}

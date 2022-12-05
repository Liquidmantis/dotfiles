require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Load all the defaults
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.export"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "org"
      }
    },
    ["core.integrations.telescope"] = {},
    ["core.export.markdown"] = {},
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          notes = "~/notes",
          org = "~/org",
          gtd = "~/gtd"
        },
        default_workspace = "org",
      }
    }
  }
}

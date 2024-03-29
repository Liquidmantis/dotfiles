require("zk").setup({
  picker = "telescope",

  lsp = {
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
    },

    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
      enabled = false,
      filetypes = { "markdown" },
    },
  },
})

local zk = require("zk")
local commands = require("zk.commands")

local function make_edit_fn(defaults, picker_options)
  return function(options)
    options = vim.tbl_extend("force", defaults, options or {})
    zk.edit(options, picker_options)
  end
end

commands.add("ZkDailies", make_edit_fn({ tags = { "daily" }, sort = {"created"} }, { title = "Zk Daily Notes" }))
commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
commands.add("ZkRecents", make_edit_fn({ modifiedAfter = "4 weeks ago", sort = {"modified"} }, { title = "Zk Recents" }))
commands.add("ZkToday", function()
  local timestamp = os.time(os.date('*t'))
  local day_before = os.date('%Y-%m-%d', timestamp - 86400)
  local day_after = os.date('%Y-%m-%d', timestamp + 86400)

  zk.new({ group = "daily",
           dir = "daily",
           extra = { yesterday = day_before, tomorrow = day_after }
         })
end)

commands.add("ZkMeetingAkvelon", function()
  zk.new({ group = "meeting-akvelon",
           dir = "meeting",
           title = "Akvelon Meeting {{format-date now}}"
         })
end)

commands.add("ZkMeetingMacCloud", function()
  zk.new({ group = "meeting-maccloud",
           dir = "meeting",
           title = "MacCloud Meeting {{format-date now}}"
         })
end)

return {
  'obsidian-nvim/obsidian.nvim',

  config = function()
    require('obsidian').setup({
      -- disable UI changes in favor of Markdown Renderer
      ui = { enable = false },
      legacy_commands = false,

      workspaces = {
        {
          name = "notes",
          path = "~/notes"
        },
      },

      templates = {
        folder = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "HH:mm",
      },

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "daily",
        template = "daily.md"
      },

      new_notes_location = "current_dir",

      attachments = {
        folder = "attachments",
      },

      completion = {
        -- Set to false to disable completion.
        nvim_cmp = false,

        -- Trigger completion at 2 chars.
        min_chars = 2,

        use_path_only = false,
      },

      -- override the default behavior of adding a timestamp prefix to new notes.
      note_id_func = function(title)
        return title
      end,

      frontmatter = {
        func = function(note)
          local out = { tags = note.tags }
          if not (note.metadata and note.metadata.creation_date) then
            out.creation_date = os.date("%Y-%m-%d")
          end
          if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do out[k] = v end
          end
          return out
        end,
        sort = { "creation_date", "tags" },
      },
    })
  end
}

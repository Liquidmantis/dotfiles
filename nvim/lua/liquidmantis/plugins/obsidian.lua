return {
  'epwalsh/obsidian.nvim',

  config = function()
    require('obsidian').setup({
      -- disable UI changes in favor of Markdown Renderer
      ui = { enable = false },

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
        img_folder = "attachments",
      },

      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = false,

        -- Trigger completion at 2 chars.
        min_chars = 2,

        use_path_only = false,
      },

      preferred_link_style = "wiki",

      -- override the default behavior of adding a timestamp prefix to new notes.
      note_id_func = function(title)
        return title
      end,

      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "open", url }) -- Mac OS
      end,
    })
  end
}

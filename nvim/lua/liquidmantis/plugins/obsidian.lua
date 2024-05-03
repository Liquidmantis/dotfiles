local obsidian_installed, obsidian = pcall(require, 'obsidian')
if not obsidian_installed then
  vim.notify('obsidian not installed', 'error')
  return
end

obsidian.setup({

  workspaces = {
    {
      name = "notes",
      path = "~/notes",
    },
  },

  templates = {
    subdir = "Templates",
    date_format = "YYYY-MM-DD",
    time_format = "HH:mm",
  },

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "daily",
    template = "daily.md"
  },

  new_notes_location = "current_dir",

  -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,

    -- Trigger completion at 2 chars.
    min_chars = 2,

    use_path_only = false,
  },

  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({"open", url})  -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
  end,
})

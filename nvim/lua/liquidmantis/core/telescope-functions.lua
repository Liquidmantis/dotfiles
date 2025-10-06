local M = {}
local builtin = require('telescope.builtin')

M.quickfix_grep = function()
  -- Get unique file paths from the quickfix list, using filename or bufnr
  local qf = vim.fn.getqflist()
  local files_set = {}
  for _, item in ipairs(qf) do
    local fname = item.filename
    if (not fname or fname == '') and item.bufnr and item.bufnr > 0 then
      fname = vim.api.nvim_buf_get_name(item.bufnr)
    end
    if fname and fname ~= '' then
      -- Optionally resolve to absolute path
      fname = vim.fn.fnamemodify(fname, ':p')
      files_set[fname] = true
    end
  end
  local files = {}
  for f, _ in pairs(files_set) do
    table.insert(files, f)
  end

  if #files == 0 then
    vim.notify("Quickfix list is empty or contains no valid files.", vim.log.levels.WARN)
    return
  end

  builtin.live_grep({
    prompt_title = 'Grep Quickfix',
    search_dirs = files,
  })
end

M.grep_notes = function()
  require('telescope.builtin').live_grep {
    prompt_title = 'Grep notes ',
    search_dirs = { '~/notes/' },
    path_display = { 'tail' }
  }
end

M.find_notes = function()
  require('telescope.builtin').find_files {
    prompt_title = 'Search notes',
    path_display = { 'tail' },
    cwd = '~/notes/',
  }
end

M.search_in_buffer = function()
  local opt = require('telescope.themes').get_ivy({
    sorting_strategy = "ascending",
    prompt_position = "top",
    winblend = 10
  })
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

M.buffer_list = function()
  require('telescope.builtin').buffers({
    prompt_title = 'Buffers',
    sort_mru = true,
    ignore_current_buffer = true,
  })
end

return M

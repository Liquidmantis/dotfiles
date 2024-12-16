local M = {}

M.grep_notes = function()
  require('telescope.builtin').live_grep {
    search_dirs = { '~/notes/' },
    prompt_prefix = 'Grep notes: ',
    path_display = { 'tail' }
  }
end

M.find_notes = function()
  require('telescope.builtin').find_files {
    prompt_title = 'Search notes',
    prompt_prefix = '?: ',
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

return M

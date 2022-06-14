local my = {}

function my.grep_notes()
  require('telescope.builtin').live_grep {
    search_dirs = {'~/notes/'},
    prompt_prefix = 'Grep notes: ',
    path_display = {'tail'}
  }
end

function my.find_notes()
  require('telescope.builtin').file_browser {
    prompt_title = 'Search notes',
    prompt_prefix = '?: ',
    path_display = {'tail'},
    cwd = '~/notes/',

    -- layout_strategy = 'horizontal',
      -- layout_config = {
        -- width = 0.5,
      -- preview_width = 0.65,
      -- }
  }
end

function my.search_in_buffer()
  local opt = require('telescope.themes').get_ivy({
    sorting_strategy = "ascending",
    prompt_position = "top",
    winblend = 10
  })
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return my



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

return my

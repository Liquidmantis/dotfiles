require('telescope').setup{
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')

local my = {}

function my.grep_notes()
  require('telescope.builtin').live_grep {
    search_dirs = {'~/notes/'},
    prompt_prefix = 'Grep notes: ',
    shorten_path = true
  }
end

function my.find_notes()
  require('telescope.builtin').file_browser {
    prompt_title = 'Search notes',
    prompt_prefix = '?: ',
    shorten_path = true,
    cwd = '~/notes/',
    width = 0.25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    }
  }
end 

return my

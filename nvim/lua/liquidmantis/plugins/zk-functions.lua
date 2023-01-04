local M = {}

M.new_note = function()
  vim.ui.input({
    prompt='Note Title: ',
    relative = 'editor',
    min_width = 80,
  },
  function(t)
    require('zk.commands').get('ZkNew')({title=t})
  end)
end

vim.api.nvim_create_user_command('LmNewNote', M.new_note, {})
return M


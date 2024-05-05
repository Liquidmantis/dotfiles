return {
  'rcarriga/nvim-notify',             -- Notifications UI 

  config = function()
    local notify = require('notify')
    vim.notify = notify

    notify.setup({
      background_colour = "#000000",
    })
  end
}

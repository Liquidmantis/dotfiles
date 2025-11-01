return {
  'mfussenegger/nvim-dap',

  dependencies = {
    'mfussenegger/nvim-dap-python',
    'leoluz/nvim-dap-go', -- not needed with ray-x/go.nvim
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-dap.nvim',
  },

  config = function()
    require('dap-go').setup()
    require('dapui').setup()
    require('nvim-dap-virtual-text').setup()
    require('telescope').load_extension('dap')
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

    vim.fn.sign_define('DapBreakpoint',
      { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapStopped', { text = '👉', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl =
    'DapBreakpoint' })

    local dap, dapui = require('dap'), require('dapui')
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.after.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.after.event_exited['dapui_config'] = function()
      dapui.close()
    end

    ---jump to the window of specified dapui element
    ---@param element string filetype of the element
    function jump_to_element(element)
      local visible_wins = vim.api.nvim_tabpage_list_wins(0)

      for _, win in ipairs(visible_wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == element then
          vim.api.nvim_set_current_win(win)
          return
        end
      end

      vim.notify(("element '%s' not found"):format(element), vim.log.levels.WARN)
    end
  end
}

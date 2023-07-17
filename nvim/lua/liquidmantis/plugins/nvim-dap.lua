require('dap-go').setup()
require('dapui').setup()
require('nvim-dap-virtual-text').setup()
require('telescope').load_extension('dap')

vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapStopped', { text='👉', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })

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

require('lazy').setup({
    'gptlang/CopilotChat.nvim',
})

function CopilotChatPrompt()
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event

  local input = Input({
      position = "50%",
      size = {
        width = "40%",
        height = 0.6,
      },
      border = {
        style = "single",
        text = {
          top = "[Ask your AI Overlord for help]",
          top_align = "center",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
      },
    }, {
      prompt = "> ",
      on_submit = function(value)
        local chat_cmd = string.format("CopilotChat %s", value)
        vim.cmd(chat_cmd)
      end,
  })

  -- mount/open the component
  input:mount()

  input:map("n", "<Esc>", function()
    input:unmount()
  end, { noremap = true })

  -- unmount component when cursor leaves buffer
  input:on(event.BufLeave, function()
    input:unmount()
  end)

end

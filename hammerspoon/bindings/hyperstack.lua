-- ****************************************
-- Mode: HyperStack Keybindings
-- ****************************************

local function toggle_stacking()
  local spaceType = Utils.get_current_space_type()
  if spaceType == "bsp" then
    Utils.set_space_layout('stack')
  else
    Utils.toggle_zen_mode('exit')
    -- Following up with Utils.set_space_layout ends up leaving zen mode padding and gap settings
    -- while dropping back to bsp layout.
    -- ToggleZenMode alone will cleanly exit a stack layout even if the stack is
    -- not in zen mode so for now just rolling with it.
    -- Utils.set_space_layout('bsp')
  end
end

Modes.HyperStack:bind('', 'h', function()
  Utils.yabai_msg('window', 'stack west')
  Modes.ExitHyperStack()
end)
Modes.HyperStack:bind('', 'l', function()
  Utils.yabai_msg('window', 'stack east')
  Modes.ExitHyperStack()
end)
Modes.HyperStack:bind('', 'j', function()
  Utils.yabai_msg('window', 'stack south')
  Modes.ExitHyperStack()
end)
Modes.HyperStack:bind('', 'k', function()
  Utils.yabai_msg('window', 'stack north')
  Modes.ExitHyperStack()
end)

Modes.HyperStack:bind('', 'n', function() Utils.yabai_msg('window', 'focus stack.next', 'focus stack.first') end)
Modes.HyperStack:bind('', 'p', function() Utils.yabai_msg('window', 'focus stack.prev', 'focus stack.last') end)

Modes.HyperStack:bind('', 't', function() toggle_stacking() end)

-- Pop the current window off the stack
Modes.HyperStack:bind('', 'o', function()
  Utils.yabai_msg('window', 'toggle float')
  Utils.yabai_msg('window', 'toggle float')
  Modes.ExitHyperStack()
end)

-- Modes.Exit the stack
Modes.HyperStack:bind('', 'x', function()
  Utils.toggle_zen_mode('exit')
  Utils.set_space_layout('bsp')
  Modes.ExitHyperStack()
end)

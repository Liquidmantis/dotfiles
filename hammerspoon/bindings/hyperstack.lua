-- ****************************************
-- Mode: HyperStack Keybindings
-- ****************************************

local function toggleStacking()
  local spaceType = GetCurrentSpaceType()
  if spaceType == "bsp" then
    SetSpaceLayout('stack')
  else
    ToggleZenMode('exit')
    -- Following up with SetSpaceLayout ends up leaving zen mode padding and gap settings
    -- while dropping back to bsp layout.
    -- ToggleZenMode alone will cleanly exit a stack layout even if the stack is
    -- not in zen mode so for now just rolling with it.
    -- SetSpaceLayout('bsp')
  end
end

HyperStack:bind('', 'h', function()
  YabaiMsg('window', 'stack west')
  ExitHyperStack()
end)
HyperStack:bind('', 'l', function()
  YabaiMsg('window', 'stack east')
  ExitHyperStack()
end)
HyperStack:bind('', 'j', function()
  YabaiMsg('window', 'stack south')
  ExitHyperStack()
end)
HyperStack:bind('', 'k', function()
  YabaiMsg('window', 'stack north')
  ExitHyperStack()
end)

HyperStack:bind('', 'n', function() YabaiMsg('window', 'focus stack.next', 'focus stack.first') end)
HyperStack:bind('', 'p', function() YabaiMsg('window', 'focus stack.prev', 'focus stack.last') end)

HyperStack:bind('', 't', function() toggleStacking() end)

-- Pop the current window off the stack
HyperStack:bind('', 'o', function()
  YabaiMsg('window', 'toggle float')
  YabaiMsg('window', 'toggle float')
  ExitHyperStack()
end)

-- Exit the stack
HyperStack:bind('', 'x', function()
  SetSpaceLayout('bsp')
  ExitHyperStack()
end)

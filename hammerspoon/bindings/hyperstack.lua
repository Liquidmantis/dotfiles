-- ****************************************
-- Mode: HyperStack Keybindings
-- ****************************************

hyperStack:bind('', 'escape', exitHyperStack)

hyperStack:bind('', 'h', function() yabaiMsg( 'window', 'stack west' ) exitHyperStack() end)
hyperStack:bind('', 'l', function() yabaiMsg( 'window', 'stack east' ) exitHyperStack() end)
hyperStack:bind('', 'j', function() yabaiMsg( 'window', 'stack south' ) exitHyperStack() end)
hyperStack:bind('', 'k', function() yabaiMsg( 'window', 'stack north' ) exitHyperStack() end)

hyperStack:bind('', 'n', function() yabaiMsg( 'window', 'focus stack.next', 'focus stack.first' ) exitHyperStack() end)
hyperStack:bind('', 'p', function() yabaiMsg( 'window', 'focus stack.prev', 'focus stack.last' ) exitHyperStack() end)

-- Pop the current window off the stack
hyperStack:bind('', 'o', function()
  yabaiMsg( 'window', 'toggle float' )
  yabaiMsg( 'window', 'toggle float' )
exitHyperStack() end)

-- Exit the stack
hyperStack:bind('', 'x', function() yabaiMsg( 'space', 'layout bsp' ) exitHyperStack() end)


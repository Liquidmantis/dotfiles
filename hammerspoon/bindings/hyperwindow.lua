-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

hyperWindow:bind('', 'escape', exitHyperWindow)

hyperWindow:bind('alt', 'o', function()
	enterHyperWindowOpen()
	exitHyperWindow()
end)


hyperWindow:bind('', 'r', function()
	enterHyperWindowResize()
	exitHyperWindow()
end)

hyperWindow:bind('', '/', function()
	yabaiMsg( 'window', 'toggle split' )
	exitHyperWindow()
end)

hyperWindow:bind('', 'f', function() yabaiMsg( 'window', 'toggle float' ) exitHyperWindow() end)
hyperWindow:bind('', 's', function() yabaiMsg( 'window', 'toggle sticky' ) exitHyperWindow() end)

hyperWindow:bind('', '=', function() yabaiMsg( 'window', 'ratio rel:0.05' ) end)
hyperWindow:bind('', '-', function() yabaiMsg( 'window', 'ratio rel:-0.05' ) end)
hyperWindow:bind('', 'h', function() yabaiMsg( 'window', 'ratio abs:0.30' ) exitHyperWindow() end)
hyperWindow:bind('', 'l', function() yabaiMsg( 'window', 'ratio abs:0.70' ) exitHyperWindow() end)

hyperWindow:bind('', '0', function() yabaiMsg( 'space', 'balance' ) exitHyperWindow() end)

hyperWindow:bind('', '\\', function() yabaiMsg( 'space', 'mirror y-axis' ) exitHyperWindow() end)
hyperWindow:bind('', '-', function() yabaiMsg( 'space', 'mirror x-axis' ) exitHyperWindow() end)
hyperWindow:bind('', 'o', function() yabaiMsg( 'space', 'rotate 90' ) exitHyperWindow() end)
hyperWindow:bind('shift', 'o', function() yabaiMsg( 'space', 'rotate 270' ) exitHyperWindow() end)

hyperWindow:bind('shift', 'h', function() yabaiMsg( 'window', 'stack west' ) exitHyperWindow() end)
hyperWindow:bind('shift', 'l', function() yabaiMsg( 'window', 'stack east' ) exitHyperWindow() end)
hyperWindow:bind('shift', 'j', function() yabaiMsg( 'window', 'stack south' ) exitHyperWindow() end)
hyperWindow:bind('shift', 'k', function() yabaiMsg( 'window', 'stack north' ) exitHyperWindow() end)

-- SubMode: HyperWindowResize Keybindings

hyperWindowResize:bind('', 'escape', exitHyperWindowResize)

-- Yabai window resizing targets an edge that is adjacent to other windows
-- Using the OR operator allows thinking in terms of the window division
-- and letting "error handling" conduct the logical operation regardless of
-- window focus and relative internal edge.
hyperWindowResize:bind('', 'h', function() yabaiMsg( 'window', 'resize right:-30:0', 'resize left:-30:0' ) end)
hyperWindowResize:bind('', 'l', function() yabaiMsg( 'window', 'resize right:30:0', 'resize left:30:0' ) end)
hyperWindowResize:bind('', 'j', function() yabaiMsg( 'window', 'resize top:30:0', 'resize botton:30:0' ) end)
hyperWindowResize:bind('', 'k', function() yabaiMsg( 'window', 'resize top:-30:0', 'resize botton:-30:0' ) end)

-- SubMode: HyperWindowOpen Keybindings

hyperWindowOpen:bind('', 'escape', exitHyperWindowOpen)

hyperWindowOpen:bind('', 'h', function() yabaiMsg( 'window', 'insert west' ) exitHyperWindowOpen() end)
hyperWindowOpen:bind('', 'l', function() yabaiMsg( 'window', 'insert east' ) exitHyperWindowOpen() end)
hyperWindowOpen:bind('', 'j', function() yabaiMsg( 'window', 'insert south' ) exitHyperWindowOpen() end)
hyperWindowOpen:bind('', 'k', function() yabaiMsg( 'window', 'insert north' ) exitHyperWindowOpen() end)

-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

HyperWindow:bind('', 'escape', ExitHyperWindow)

HyperWindow:bind('alt', 'o', function()
	EnterHyperWindowOpen()
	ExitHyperWindow()
end)


HyperWindow:bind('', 'r', function()
	EnterHyperWindowResize()
	ExitHyperWindow()
end)

HyperWindow:bind('', 't', function()
	EnterHyperWindowTransparency()
	ExitHyperWindow()
end)

HyperWindow:bind('', '/', function()
	YabaiMsg( 'window', 'toggle split' )
	ExitHyperWindow()
end)

HyperWindow:bind('', 'f', function() YabaiMsg( 'window', 'toggle float' ) ExitHyperWindow() end)
HyperWindow:bind('', 's', function() YabaiMsg( 'window', 'toggle sticky' ) ExitHyperWindow() end)

HyperWindow:bind('', '=', function() YabaiMsg( 'window', 'ratio rel:0.05' ) end)
HyperWindow:bind('', '-', function() YabaiMsg( 'window', 'ratio rel:-0.05' ) end)
HyperWindow:bind('', 'h', function() YabaiMsg( 'window', 'ratio abs:0.30' ) ExitHyperWindow() end)
HyperWindow:bind('', 'l', function() YabaiMsg( 'window', 'ratio abs:0.70' ) ExitHyperWindow() end)

HyperWindow:bind('', '0', function() YabaiMsg( 'space', 'balance' ) ExitHyperWindow() end)

HyperWindow:bind('', '\\', function() YabaiMsg( 'space', 'mirror y-axis' ) ExitHyperWindow() end)
HyperWindow:bind('shift', '-', function() YabaiMsg( 'space', 'mirror x-axis' ) ExitHyperWindow() end)
HyperWindow:bind('', 'o', function() YabaiMsg( 'space', 'rotate 90' ) ExitHyperWindow() end)
HyperWindow:bind('shift', 'o', function() YabaiMsg( 'space', 'rotate 270' ) ExitHyperWindow() end)

HyperWindow:bind('shift', 'h', function() YabaiMsg( 'window', 'stack west' ) ExitHyperWindow() end)
HyperWindow:bind('shift', 'l', function() YabaiMsg( 'window', 'stack east' ) ExitHyperWindow() end)
HyperWindow:bind('shift', 'j', function() YabaiMsg( 'window', 'stack south' ) ExitHyperWindow() end)
HyperWindow:bind('shift', 'k', function() YabaiMsg( 'window', 'stack north' ) ExitHyperWindow() end)

-- SubMode: HyperWindowResize Keybindings

HyperWindowResize:bind('', 'escape', ExitHyperWindowResize)

-- Yabai window resizing targets an edge that is adjacent to other windows
-- Using the OR operator allows thinking in terms of the window division
-- and letting "error handling" conduct the logical operation regardless of
-- window focus and relative internal edge.
HyperWindowResize:bind('', 'h', function() YabaiMsg( 'window', 'resize right:-30:0', 'resize left:-30:0' ) end)
HyperWindowResize:bind('', 'l', function() YabaiMsg( 'window', 'resize right:30:0', 'resize left:30:0' ) end)
HyperWindowResize:bind('', 'j', function() YabaiMsg( 'window', 'resize top:0:30', 'resize bottom:0:30' ) end)
HyperWindowResize:bind('', 'k', function() YabaiMsg( 'window', 'resize top:0:-30', 'resize bottom:0:-30' ) end)

-- SubMode: HyperWindowOpen Keybindings

HyperWindowOpen:bind('', 'escape', ExitHyperWindowOpen)

HyperWindowOpen:bind('', 'h', function() YabaiMsg( 'window', 'insert west' ) ExitHyperWindowOpen() end)
HyperWindowOpen:bind('', 'l', function() YabaiMsg( 'window', 'insert east' ) ExitHyperWindowOpen() end)
HyperWindowOpen:bind('', 'j', function() YabaiMsg( 'window', 'insert south' ) ExitHyperWindowOpen() end)
HyperWindowOpen:bind('', 'k', function() YabaiMsg( 'window', 'insert north' ) ExitHyperWindowOpen() end)

-- SubMode: HyperWindowTransparency Keybindings

HyperWindowTransparency:bind('', 'escape', ExitHyperWindowTransparency)

HyperWindowTransparency:bind('', '0', function() YabaiMsg( 'window', 'opacity 1.0') ExitHyperWindowTransparency() end)
HyperWindowTransparency:bind('', '9', function() YabaiMsg( 'window', 'opacity 0.9') ExitHyperWindowTransparency() end)
HyperWindowTransparency:bind('', '8', function() YabaiMsg( 'window', 'opacity 0.8') ExitHyperWindowTransparency() end)
HyperWindowTransparency:bind('', '7', function() YabaiMsg( 'window', 'opacity 0.7') ExitHyperWindowTransparency() end)
HyperWindowTransparency:bind('', '6', function() YabaiMsg( 'window', 'opacity 0.6') ExitHyperWindowTransparency() end)
HyperWindowTransparency:bind('', '5', function() YabaiMsg( 'window', 'opacity 0.5') ExitHyperWindowTransparency() end)
HyperWindowTransparency:bind('', '4', function() YabaiMsg( 'window', 'opacity 0.4') ExitHyperWindowTransparency() end)
HyperWindowTransparency:bind('', '=', function() YabaiMsg( 'window', 'opacity 0.0') ExitHyperWindowTransparency() end)

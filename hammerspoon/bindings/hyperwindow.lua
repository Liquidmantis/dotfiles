-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

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

HyperWindow:bind('', '/', function() YabaiMsg( 'window', 'toggle split' ) end)

HyperWindow:bind('', 'f', function() YabaiMsg( 'window', 'toggle float' ) end)
HyperWindow:bind('', 's', function() YabaiMsg( 'window', 'toggle sticky' ) end)

HyperWindow:bind('alt', 'l', function() YabaiMsg( 'window', 'ratio rel:0.05' ) end)
HyperWindow:bind('alt', 'h', function() YabaiMsg( 'window', 'ratio rel:-0.05' ) end)
HyperWindow:bind('', 'h', function() YabaiMsg( 'window', 'ratio abs:0.30' ) end)
HyperWindow:bind('', 'l', function() YabaiMsg( 'window', 'ratio abs:0.70' ) end)
HyperWindow:bind('', '=', function() YabaiMsg( 'space', 'balance' ) end)

HyperWindow:bind('', '0', function() YabaiMsg( 'space', 'balance' ) end)

HyperWindow:bind('', '\\', function() YabaiMsg( 'space', 'mirror y-axis' ) end)
HyperWindow:bind('shift', '-', function() YabaiMsg( 'space', 'mirror x-axis' ) end)
HyperWindow:bind('', 'o', function() YabaiMsg( 'space', 'rotate 90' ) end)
HyperWindow:bind('shift', 'o', function() YabaiMsg( 'space', 'rotate 270' ) end)

HyperWindow:bind('shift', 'h', function() YabaiMsg( 'window', 'stack west' ) end)
HyperWindow:bind('shift', 'l', function() YabaiMsg( 'window', 'stack east' ) end)
HyperWindow:bind('shift', 'j', function() YabaiMsg( 'window', 'stack south' ) end)
HyperWindow:bind('shift', 'k', function() YabaiMsg( 'window', 'stack north' ) end)

-- SubMode: HyperWindowResize Keybindings

-- Yabai window resizing targets an edge that is adjacent to other windows
-- Using the OR operator allows thinking in terms of the window division
-- and letting "error handling" conduct the logical operation regardless of
-- window focus and relative internal edge.
HyperWindowResize:bind('', 'h', function() YabaiMsg( 'window', 'resize right:-30:0', 'resize left:-30:0' ) end)
HyperWindowResize:bind('', 'l', function() YabaiMsg( 'window', 'resize right:30:0', 'resize left:30:0' ) end)
HyperWindowResize:bind('', 'j', function() YabaiMsg( 'window', 'resize top:0:30', 'resize bottom:0:30' ) end)
HyperWindowResize:bind('', 'k', function() YabaiMsg( 'window', 'resize top:0:-30', 'resize bottom:0:-30' ) end)

-- SubMode: HyperWindowTransparency Keybindings

HyperWindowTransparency:bind('', '0', function() YabaiMsg( 'window', 'opacity 1.0') end)
HyperWindowTransparency:bind('', '9', function() YabaiMsg( 'window', 'opacity 0.9') end)
HyperWindowTransparency:bind('', '8', function() YabaiMsg( 'window', 'opacity 0.8') end)
HyperWindowTransparency:bind('', '7', function() YabaiMsg( 'window', 'opacity 0.7') end)
HyperWindowTransparency:bind('', '6', function() YabaiMsg( 'window', 'opacity 0.6') end)
HyperWindowTransparency:bind('', '5', function() YabaiMsg( 'window', 'opacity 0.5') end)
HyperWindowTransparency:bind('', '4', function() YabaiMsg( 'window', 'opacity 0.4') end)
HyperWindowTransparency:bind('', '3', function() YabaiMsg( 'window', 'opacity 0.3') end)
HyperWindowTransparency:bind('', '2', function() YabaiMsg( 'window', 'opacity 0.2') end)
HyperWindowTransparency:bind('', '1', function() YabaiMsg( 'window', 'opacity 0.1') end)
HyperWindowTransparency:bind('', '=', function() YabaiMsg( 'window', 'opacity 0.0') end)

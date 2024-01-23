-- *******************************
-- Mode: HyperSpace  bindings
-- *******************************

HyperSpace:bind('', 'escape', ExitHyperSpace)

HyperSpace:bind('', 'z', function()
  EnterHyperSpaceZen()
  ExitHyperSpace()
end)

-- change space layouts
HyperSpace:bind('', 'b', function() YabaiMsg( 'space', 'layout bsp' ) ExitHyperSpace() end)
HyperSpace:bind('', 'f', function() YabaiMsg( 'space', 'layout float' ) ExitHyperSpace() end)
HyperSpace:bind('', 't', function() YabaiMsg( 'space', 'layout stack' ) ExitHyperSpace() end)

HyperSpace:bind('', '=', function() YabaiMsg( 'space', 'balance' ) ExitHyperSpace() end)

HyperSpace:bind('', 'c', function() YabaiMsg( 'space', 'create' ) ExitHyperSpace() end)
HyperSpace:bind('', 'x', function() YabaiMsg( 'space', 'destroy' ) ExitHyperSpace() end)

HyperSpace:bind('', '1', function() YabaiMsg( 'space', 'focus 1' ) ExitHyperSpace() end)
HyperSpace:bind('', '2', function() YabaiMsg( 'space', 'focus 2' ) ExitHyperSpace() end)
HyperSpace:bind('', '3', function() YabaiMsg( 'space', 'focus 3' ) ExitHyperSpace() end)
HyperSpace:bind('', '4', function() YabaiMsg( 'space', 'focus 4' ) ExitHyperSpace() end)

HyperSpace:bind('shift', '1', function() YabaiMsg( 'window', 'space 1' ) ExitHyperSpace() end)
HyperSpace:bind('shift', '2', function() YabaiMsg( 'window', 'space 2' ) ExitHyperSpace() end)
HyperSpace:bind('shift', '3', function() YabaiMsg( 'window', 'space 3' ) ExitHyperSpace() end)
HyperSpace:bind('shift', '4', function() YabaiMsg( 'window', 'space 4' ) ExitHyperSpace() end)

HyperSpace:bind('', 'o', function() YabaiMsg( 'space', 'focus recent' ) ExitHyperSpace() end)
HyperSpace:bind('', 'h', function() YabaiMsg( 'space', 'focus prev' ) ExitHyperSpace() end)
HyperSpace:bind('', 'l', function() YabaiMsg( 'space', 'focus next' ) ExitHyperSpace() end)
HyperSpace:bind('', 'p', function() YabaiMsg( 'space', 'focus prev', 'focus last' ) ExitHyperSpace() end)
HyperSpace:bind('', 'n', function() YabaiMsg( 'space', 'focus next', 'focus first' ) ExitHyperSpace() end)

HyperSpace:bind('', 's', function() YabaiMsg( 'space', 'toggle mission-control' ) ExitHyperSpace() end)

-- TODO: refactor this to pass a function and parameter instead of this copy pasta
HyperSpace:bind('alt', '1', function() SetPadding(1,1) ExitHyperSpace() end)
HyperSpace:bind('alt', '2', function() SetPadding(2,2) ExitHyperSpace() end)
HyperSpace:bind('alt', '3', function() SetPadding(3,3) ExitHyperSpace() end)
HyperSpace:bind('alt', '4', function() SetPadding(4,4) ExitHyperSpace() end)
HyperSpace:bind('alt', '5', function() SetPadding(5,5) ExitHyperSpace() end)
HyperSpace:bind('alt', '6', function() SetPadding(6,6) ExitHyperSpace() end)
HyperSpace:bind('alt', '7', function() SetPadding(7,7) ExitHyperSpace() end)
HyperSpace:bind('alt', '8', function() SetPadding(8,8) ExitHyperSpace() end)
HyperSpace:bind('alt', '9', function() SetPadding(9,9) ExitHyperSpace() end)
HyperSpace:bind('alt', '0', function() SetPadding(0,0) ExitHyperSpace() end)
HyperSpace:bind('alt', '=', function() SetPadding('=','=') ExitHyperSpace() end)

-- SubMode: HyperSpaceZen Keybindings

HyperSpaceZen:bind('', 'escape', ExitHyperSpaceZen)

HyperSpaceZen:bind('', 'z', function() ToggleZenMode('zen') ExitHyperSpaceZen() end)
HyperSpaceZen:bind('', 'n', function() ToggleZenMode('narrow') ExitHyperSpaceZen() end)
HyperSpaceZen:bind('', 'w', function() ToggleZenMode('wide') ExitHyperSpaceZen() end)
HyperSpaceZen:bind('', 'f', function() ToggleZenMode('full') ExitHyperSpaceZen() end)
HyperSpaceZen:bind('', 'x', function() ToggleZenMode('exit') ExitHyperSpaceZen() end)



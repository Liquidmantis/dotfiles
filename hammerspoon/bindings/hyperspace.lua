-- *******************************
-- Mode: HyperSpace  bindings
-- *******************************

HyperSpace:bind('', 'z', function()
  EnterHyperSpaceZen()
  ExitHyperSpace()
end)

-- change space layouts
HyperSpace:bind('', 'b', function() YabaiMsg( 'space', 'layout bsp' ) end)
HyperSpace:bind('', 'f', function() YabaiMsg( 'space', 'layout float' ) end)
HyperSpace:bind('', 't', function() YabaiMsg( 'space', 'layout stack' ) end)

HyperSpace:bind('', '=', function() YabaiMsg( 'space', 'balance' ) end)

if State.IS_WORK_COMPUTER then
  HyperSpace:bind('', '1', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '1') end)
  HyperSpace:bind('', '2', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '2') end)
  HyperSpace:bind('', '3', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '3') end)
  HyperSpace:bind('', '4', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '4') end)
  HyperSpace:bind('', '5', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '5') end)
  HyperSpace:bind('', '6', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '6') end)
  HyperSpace:bind('', '7', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '7') end)
  HyperSpace:bind('', '8', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, '8') end)
  HyperSpace:bind('', 'h', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, 'h') end)
  HyperSpace:bind('', 'l', function()  hs.eventtap.keyStroke({'ctrl','alt','cmd'}, 'l') end)
else
  HyperSpace:bind('', 'c', function() YabaiMsg( 'space', 'create' ) end)
  HyperSpace:bind('', 'x', function() YabaiMsg( 'space', 'destroy' ) end)

  HyperSpace:bind('', '1', function() YabaiMsg( 'space', 'focus 1' ) end)
  HyperSpace:bind('', '2', function() YabaiMsg( 'space', 'focus 2' ) end)
  HyperSpace:bind('', '3', function() YabaiMsg( 'space', 'focus 3' ) end)
  HyperSpace:bind('', '4', function() YabaiMsg( 'space', 'focus 4' ) end)
  HyperSpace:bind('', 'h', function() YabaiMsg( 'space', 'focus prev' ) end)
  HyperSpace:bind('', 'l', function() YabaiMsg( 'space', 'focus next' ) end)
  HyperSpace:bind('', 'o', function() YabaiMsg( 'space', 'focus recent' ) end)
  HyperSpace:bind('', 'p', function() YabaiMsg( 'space', 'focus prev', 'focus last' ) end)
  HyperSpace:bind('', 'n', function() YabaiMsg( 'space', 'focus next', 'focus first' ) end)

  HyperSpace:bind('shift', '1', function() YabaiMsg( 'window', 'space 1' ) end)
  HyperSpace:bind('shift', '2', function() YabaiMsg( 'window', 'space 2' ) end)
  HyperSpace:bind('shift', '3', function() YabaiMsg( 'window', 'space 3' ) end)
  HyperSpace:bind('shift', '4', function() YabaiMsg( 'window', 'space 4' ) end)
end

HyperSpace:bind('', 's', function() YabaiMsg( 'space', 'toggle mission-control' ) end)

HyperSpace:bind('alt', '1', function() SetPadding(1,1) end)
HyperSpace:bind('alt', '2', function() SetPadding(2,2) end)
HyperSpace:bind('alt', '3', function() SetPadding(3,3) end)
HyperSpace:bind('alt', '4', function() SetPadding(4,4) end)
HyperSpace:bind('alt', '5', function() SetPadding(5,5) end)
HyperSpace:bind('alt', '6', function() SetPadding(6,6) end)
HyperSpace:bind('alt', '7', function() SetPadding(7,7) end)
HyperSpace:bind('alt', '8', function() SetPadding(8,8) end)
HyperSpace:bind('alt', '9', function() SetPadding(9,9) end)
HyperSpace:bind('alt', '0', function() SetPadding(0,0) end)
HyperSpace:bind('alt', '=', function() SetPadding('=','=') end)

-- SubMode: HyperSpaceZen Keybindings

HyperSpaceZen:bind('', 'z', function() ToggleZenMode('zen') end)
HyperSpaceZen:bind('', 'n', function() ToggleZenMode('narrow') end)
HyperSpaceZen:bind('', 'w', function() ToggleZenMode('wide') end)
HyperSpaceZen:bind('', 'f', function() ToggleZenMode('full') end)
HyperSpaceZen:bind('', 'x', function() ToggleZenMode('exit') end)

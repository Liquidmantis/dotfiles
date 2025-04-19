-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

Modes.HyperWindow:bind('alt', 'o', function()
  Modes.EnterHyperWindowOpen()
end)

Modes.HyperWindow:bind('', 'm', function()
  Modes.EnterHyperWindowMove()
end)

Modes.HyperWindow:bind('', 'r', function()
  Modes.EnterHyperWindowResize()
end)

Modes.HyperWindow:bind('', 't', function()
  Modes.EnterHyperWindowTransparency()
end)

Modes.HyperWindow:bind('', '/', function() Utils.yabai_msg('window', 'toggle split') end)

Modes.HyperWindow:bind('', 'f', function() Utils.yabai_msg('window', 'toggle float') end)
Modes.HyperWindow:bind('', 's', function() Utils.yabai_msg('window', 'toggle sticky') end)

Modes.HyperWindow:bind('alt', 'l', function() Utils.yabai_msg('window', 'ratio rel:0.05') end)
Modes.HyperWindow:bind('alt', 'h', function() Utils.yabai_msg('window', 'ratio rel:-0.05') end)
Modes.HyperWindow:bind('', 'h', function() Utils.yabai_msg('window', 'ratio abs:0.30') end)
Modes.HyperWindow:bind('', 'l', function() Utils.yabai_msg('window', 'ratio abs:0.70') end)
Modes.HyperWindow:bind('', '=', function() Utils.yabai_msg('space', 'balance') end)

Modes.HyperWindow:bind('', '0', function() Utils.yabai_msg('space', 'balance') end)

Modes.HyperWindow:bind('', '\\', function() Utils.yabai_msg('space', 'mirror y-axis') end)
Modes.HyperWindow:bind('shift', '-', function() Utils.yabai_msg('space', 'mirrorx-axis') end)
Modes.HyperWindow:bind('', 'o', function() Utils.yabai_msg('space', 'rotate 90') end)
Modes.HyperWindow:bind('shift', 'o', function() Utils.yabai_msg('space', 'rotate 270') end)

Modes.HyperWindow:bind('shift', 'h', function() Utils.yabai_msg('window', 'stack west') end)
Modes.HyperWindow:bind('shift', 'l', function() Utils.yabai_msg('window', 'stack east') end)
Modes.HyperWindow:bind('shift', 'j', function() Utils.yabai_msg('window', 'stack south') end)
Modes.HyperWindow:bind('shift', 'k', function() Utils.yabai_msg('window', 'stack north') end)

Modes.HyperWindowMove:bind('', 'h', function() Utils.yabai_msg('window', 'grid 1:3:0:0:2:1') end)
Modes.HyperWindowMove:bind('', 'l', function() Utils.yabai_msg('window', 'grid 1:3:1:0:3:1') end)

-- SubMode: HyperWindowResize Keybindings

-- Yabai window resizing targets an edge that is adjacent to other windows
-- Using the OR operator allows thinking in terms of the window division,
-- thinking of moving the split between the tiled windows,
-- and letting "error handling" conduct the logical operation regardless of
-- window focus and relative internal edge.
-- This logic fails on resizing floating windows, however.  They are the exception, though.
Modes.HyperWindowResize:bind('', 'h',
  function() Utils.yabai_msg('window', 'resize right:-300:0', 'resize left:-300:0') end)
Modes.HyperWindowResize:bind('', 'l', function() Utils.yabai_msg('window', 'resize right:300:0', 'resize left:300:0') end)
Modes.HyperWindowResize:bind('', 'j', function() Utils.yabai_msg('window', 'resize top:0:300', 'resize bottom:0:300') end)
Modes.HyperWindowResize:bind('', 'k',
  function() Utils.yabai_msg('window', 'resize top:0:-300', 'resize bottom:0:-300') end)
Modes.HyperWindowResize:bind('shift', 'h',
  function() Utils.yabai_msg('window', 'resize right:-30:0', 'resize left:-30:0') end)
Modes.HyperWindowResize:bind('shift', 'l',
  function() Utils.yabai_msg('window', 'resize right:30:0', 'resize left:30:0') end)
Modes.HyperWindowResize:bind('shift', 'j',
  function() Utils.yabai_msg('window', 'resize top:0:30', 'resize bottom:0:30') end)
Modes.HyperWindowResize:bind('shift', 'k',
  function() Utils.yabai_msg('window', 'resize top:0:-30', 'resize bottom:0:-30') end)

-- SubMode: HyperWindowTransparency Keybindings

Modes.HyperWindowTransparency:bind('', '0', function() Utils.yabai_msg('window', 'opacity 1.0') end)
Modes.HyperWindowTransparency:bind('', '9', function() Utils.yabai_msg('window', 'opacity 0.9') end)
Modes.HyperWindowTransparency:bind('', '8', function() Utils.yabai_msg('window', 'opacity 0.8') end)
Modes.HyperWindowTransparency:bind('', '7', function() Utils.yabai_msg('window', 'opacity 0.7') end)
Modes.HyperWindowTransparency:bind('', '6', function() Utils.yabai_msg('window', 'opacity 0.6') end)
Modes.HyperWindowTransparency:bind('', '5', function() Utils.yabai_msg('window', 'opacity 0.5') end)
Modes.HyperWindowTransparency:bind('', '4', function() Utils.yabai_msg('window', 'opacity 0.4') end)
Modes.HyperWindowTransparency:bind('', '3', function() Utils.yabai_msg('window', 'opacity 0.3') end)
Modes.HyperWindowTransparency:bind('', '2', function() Utils.yabai_msg('window', 'opacity 0.2') end)
Modes.HyperWindowTransparency:bind('', '1', function() Utils.yabai_msg('window', 'opacity 0.1') end)
Modes.HyperWindowTransparency:bind('', '=', function() Utils.yabai_msg('window', 'opacity 0.0') end)

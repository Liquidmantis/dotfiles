-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

Modes.HyperWindow:bind('alt', 'o', function() Modes.EnterHyperWindowOpen() end)
Modes.HyperWindow:bind('', 'm', function() Modes.EnterHyperWindowMove() end)
Modes.HyperWindow:bind('', 'r', function() Modes.EnterHyperWindowResize() end)
Modes.HyperWindow:bind('', 't', function() Modes.EnterHyperWindowTransparency() end)
Modes.HyperWindow:bind('', 'w', function() Modes.EnterHyperWindowPosition() end)

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

-- Modes.HyperWindowMove:bind('', 'h', function() Utils.yabai_msg('window', 'grid 1:3:0:0:2:1') end)
-- Modes.HyperWindowMove:bind('', 'l', function() Utils.yabai_msg('window', 'grid 1:3:1:0:3:1') end)
Modes.HyperWindowMove:bind('', 'u', function() Utils.yabai_msg('window', 'move rel:-100:-100') end)
Modes.HyperWindowMove:bind('', 'i', function() Utils.yabai_msg('window', 'move rel:0:-100') end)
Modes.HyperWindowMove:bind('', 'o', function() Utils.yabai_msg('window', 'move rel:100:-100') end)
Modes.HyperWindowMove:bind('', 'j', function() Utils.yabai_msg('window', 'move rel:-100:0') end)
Modes.HyperWindowMove:bind('', 'l', function() Utils.yabai_msg('window', 'move rel:100:0') end)
Modes.HyperWindowMove:bind('', 'm', function() Utils.yabai_msg('window', 'move rel:-100:100') end)
Modes.HyperWindowMove:bind('', ',', function() Utils.yabai_msg('window', 'move rel:0:100') end)
Modes.HyperWindowMove:bind('', '.', function() Utils.yabai_msg('window', 'move rel:100:100') end)
Modes.HyperWindowMove:bind('', 'r', function()
  Modes.ExitHyperWindowMove()
  Modes.EnterHyperWindowResize()
end)
Modes.HyperWindowMove:bind('', 'w', function()
  Modes.ExitHyperWindowMove()
  Modes.EnterHyperWindowPosition()
end)

local width = {
  half = State.SCREEN_WIDTH / 2,
  half_padded = State.SCREEN_WIDTH / 2 - State.initial.x_pad,
  full = State.SCREEN_WIDTH,
  full_padded = State.SCREEN_WIDTH - State.initial.x_pad * 2,
  pad = State.initial.x_pad
}

local height = {
  half = State.SCREEN_HEIGHT / 2,
  half_padded = State.SCREEN_HEIGHT / 2 - State.initial.y_pad,
  full = State.SCREEN_HEIGHT,
  full_padded = State.SCREEN_HEIGHT - State.initial.y_pad * 2,
  notch = State.NOTCH_HEIGHT,
  top = State.NOTCH_HEIGHT + State.initial.y_pad,
  pad = State.initial.y_pad
}

Modes.HyperWindowPosition:bind('', 'u', function()
  Utils.yabai_msg('window', 'move abs:' .. width.pad .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. width.half_padded .. ':' .. height.half)
end)
Modes.HyperWindowPosition:bind('', 'j', function()
  Utils.yabai_msg('window', 'move abs:' .. width.pad .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. width.half_padded .. ':' .. height.full_padded)
end)
Modes.HyperWindowPosition:bind('', 'm', function()
  Utils.yabai_msg('window', 'move abs:' .. width.pad .. ':' .. height.half + height.notch)
  Utils.yabai_msg('window', 'resize abs:' .. width.half_padded .. ':' .. height.half_padded)
end)
Modes.HyperWindowPosition:bind('', 'i', function()
  Utils.yabai_msg('window', 'move abs:' .. width.pad .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. width.full_padded .. ':' .. height.half_padded)
end)
Modes.HyperWindowPosition:bind('', 'k', function()
  Utils.yabai_msg('window', 'move abs:' .. width.pad .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. width.full_padded .. ':' .. height.full_padded)
end)
Modes.HyperWindowPosition:bind('', ',', function()
  Utils.yabai_msg('window', 'move abs:' .. width.pad .. ':' .. height.half + height.notch)
  Utils.yabai_msg('window', 'resize abs:' .. width.full_padded .. ':' .. height.half_padded)
end)
Modes.HyperWindowPosition:bind('', 'o', function()
  Utils.yabai_msg('window', 'move abs:' .. width.half .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. width.half_padded .. ':' .. height.half)
end)
Modes.HyperWindowPosition:bind('', 'l', function()
  Utils.yabai_msg('window', 'move abs:' .. width.half .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. width.half_padded .. ':' .. height.full_padded)
end)
Modes.HyperWindowPosition:bind('', '.', function()
  Utils.yabai_msg('window', 'move abs:' .. width.half .. ':' .. height.half + height.notch)
  Utils.yabai_msg('window', 'resize abs:' .. width.half_padded .. ':' .. height.half_padded)
end)

Modes.HyperWindowPosition:bind('alt', 'k', function()
  Utils.yabai_msg('window', 'grid 1:3:0:0:3:1')
  -- Utils.yabai_msg('window', 'move abs:' .. width.pad .. ':' .. height.top)
  -- Utils.yabai_msg('window', 'resize abs:' .. width.full_padded * .8 .. ':' .. height.full_padded * .8)
end)

local floating_width_small = width.half_padded * .75
local floating_height = height.full_padded * .75
local floating_right = width.full_padded - floating_width_small
local floating_left = width.pad
Modes.HyperWindowPosition:bind('', ';', function()
  Utils.yabai_msg('window', 'move abs:' .. floating_right .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. floating_width_small .. ':' .. floating_height)
end)
Modes.HyperWindowPosition:bind('', 'h', function()
  Utils.yabai_msg('window', 'move abs:' .. floating_left .. ':' .. height.top)
  Utils.yabai_msg('window', 'resize abs:' .. floating_width_small .. ':' .. floating_height)
end)
Modes.HyperWindowPosition:bind('', 'r', function()
  Modes.ExitHyperWindowPosition()
  Modes.EnterHyperWindowResize()
end)
-- slightly counterintuitive, but `m` is assigned, so repeating the enter key to step back out
-- into the most likely desired mode
Modes.HyperWindowPosition:bind('', 'w', function()
  Modes.ExitHyperWindowPosition()
  Modes.EnterHyperWindowMove()
end)

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
Modes.HyperWindowResize:bind('', 'j',
  function() Utils.yabai_msg('window', 'resize height.top:0:300', 'resize bottom:0:300') end)
Modes.HyperWindowResize:bind('', 'k',
  function() Utils.yabai_msg('window', 'resize height.top:0:-300', 'resize bottom:0:-300') end)
Modes.HyperWindowResize:bind('shift', 'h',
  function() Utils.yabai_msg('window', 'resize right:-30:0', 'resize left:-30:0') end)
Modes.HyperWindowResize:bind('shift', 'l',
  function() Utils.yabai_msg('window', 'resize right:30:0', 'resize left:30:0') end)
Modes.HyperWindowResize:bind('shift', 'j',
  function() Utils.yabai_msg('window', 'resize height.top:0:30', 'resize bottom:0:30') end)
Modes.HyperWindowResize:bind('shift', 'k',
  function() Utils.yabai_msg('window', 'resize height.top:0:-30', 'resize bottom:0:-30') end)
Modes.HyperWindowResize:bind('', 'm', function()
  Modes.ExitHyperWindowResize()
  Modes.EnterHyperWindowMove()
end)
Modes.HyperWindowResize:bind('', 'w', function()
  Modes.ExitHyperWindowResize()
  Modes.EnterHyperWindowPosition()
end)

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

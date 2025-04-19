-- *******************************
-- Mode: Modes.HyperSpace  bindings
-- *******************************

Modes.HyperSpace:bind('', 'z', function()
  Modes.EnterHyperSpaceZen()
  Modes.ExitHyperSpace()
end)

function Utils.set_space_layout(layout)
  Utils.yabai_msg('space', string.format("layout %s", layout))
  Utils.set_borders_color()
end

-- change space layouts
Modes.HyperSpace:bind('', 'b', function() Utils.set_space_layout('bsp') end)
Modes.HyperSpace:bind('', 'f', function() Utils.set_space_layout('float') end)
Modes.HyperSpace:bind('', 't', function() Utils.set_space_layout('stack') end)

Modes.HyperSpace:bind('', '=', function() Utils.yabai_msg('space', 'balance') end)

-- Use fallback keybindings for switching spaces on work computer since
-- SIP can't be disabled and Yaba can't manage spaces
if State.IS_WORK_COMPUTER then
  Modes.HyperSpace:bind('', '1', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '1') end)
  Modes.HyperSpace:bind('', '2', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '2') end)
  Modes.HyperSpace:bind('', '3', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '3') end)
  Modes.HyperSpace:bind('', '4', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '4') end)
  Modes.HyperSpace:bind('', '5', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '5') end)
  Modes.HyperSpace:bind('', '6', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '6') end)
  Modes.HyperSpace:bind('', '7', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '7') end)
  Modes.HyperSpace:bind('', '8', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, '8') end)
  Modes.HyperSpace:bind('', 'h', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, 'h') end)
  Modes.HyperSpace:bind('', 'l', function() hs.eventtap.keyStroke({ 'ctrl', 'alt', 'cmd' }, 'l') end)
else
  Modes.HyperSpace:bind('', 'c', function() Utils.yabai_msg('space', 'create') end)
  Modes.HyperSpace:bind('', 'x', function() Utils.yabai_msg('space', 'destroy') end)

  Modes.HyperSpace:bind('', '1', function() Utils.yabai_msg('space', 'focus 1') end)
  Modes.HyperSpace:bind('', '2', function() Utils.yabai_msg('space', 'focus 2') end)
  Modes.HyperSpace:bind('', '3', function() Utils.yabai_msg('space', 'focus 3') end)
  Modes.HyperSpace:bind('', '4', function() Utils.yabai_msg('space', 'focus 4') end)
  Modes.HyperSpace:bind('', 'h', function() Utils.yabai_msg('space', 'focus prev') end)
  Modes.HyperSpace:bind('', 'l', function() Utils.yabai_msg('space', 'focus next') end)
  Modes.HyperSpace:bind('', 'o', function() Utils.yabai_msg('space', 'focus recent') end)
  Modes.HyperSpace:bind('', 'p', function() Utils.yabai_msg('space', 'focus prev', 'focus last') end)
  Modes.HyperSpace:bind('', 'n', function() Utils.yabai_msg('space', 'focus next', 'focus first') end)

  Modes.HyperSpace:bind('shift', '1', function() Utils.yabai_msg('window', 'space 1') end)
  Modes.HyperSpace:bind('shift', '2', function() Utils.yabai_msg('window', 'space 2') end)
  Modes.HyperSpace:bind('shift', '3', function() Utils.yabai_msg('window', 'space 3') end)
  Modes.HyperSpace:bind('shift', '4', function() Utils.yabai_msg('window', 'space 4') end)
end

Modes.HyperSpace:bind('', 's', function() Utils.yabai_msg('space', 'toggle mission-control') end)

Modes.HyperSpace:bind('alt', '1', function() Utils.set_padding(1, 1) end)
Modes.HyperSpace:bind('alt', '2', function() Utils.set_padding(2, 2) end)
Modes.HyperSpace:bind('alt', '3', function() Utils.set_padding(3, 3) end)
Modes.HyperSpace:bind('alt', '4', function() Utils.set_padding(4, 4) end)
Modes.HyperSpace:bind('alt', '5', function() Utils.set_padding(5, 5) end)
Modes.HyperSpace:bind('alt', '6', function() Utils.set_padding(6, 6) end)
Modes.HyperSpace:bind('alt', '7', function() Utils.set_padding(7, 7) end)
Modes.HyperSpace:bind('alt', '8', function() Utils.set_padding(8, 8) end)
Modes.HyperSpace:bind('alt', '9', function() Utils.set_padding(9, 9) end)
Modes.HyperSpace:bind('alt', '0', function() Utils.set_padding(0, 0) end)
Modes.HyperSpace:bind('alt', '=', function() Utils.set_padding('=', '=') end)

-- SubMode: Modes.HyperSpaceZen Keybindings

Modes.HyperSpaceZen:bind('', 'z', function() Utils.toggle_zen_mode('zen') end)
Modes.HyperSpaceZen:bind('', 'n', function() Utils.toggle_zen_mode('narrow') end)
Modes.HyperSpaceZen:bind('', 'w', function() Utils.toggle_zen_mode('wide') end)
Modes.HyperSpaceZen:bind('', 'f', function() Utils.toggle_zen_mode('full') end)
Modes.HyperSpaceZen:bind('', 'x', function() Utils.toggle_zen_mode('exit') end)

-- ****************************************
-- Mode: Hyper Meta and Modal Trigger Keybindings
-- ****************************************

Modes.Hyper:bind('', 'a', Modes.EnterHyperApp)
Modes.Hyper:bind('', 'c', Modes.EnterHyperConfig)
Modes.Hyper:bind('', 'd', Modes.EnterHyperDisplay)
Modes.Hyper:bind('', 'o', Modes.EnterHyperOpen)
Modes.Hyper:bind('', 'p', Modes.EnterHyperCleanshot)
Modes.Hyper:bind('', 's', Modes.EnterHyperSpace)
Modes.Hyper:bind('', 't', Modes.EnterHyperStack)
Modes.Hyper:bind('', 'w', Modes.EnterHyperWindow)
Modes.Hyper:bind('', 'return', Modes.EnterHyperTerminal)

-- ****************************************
-- Mode: Hyper Keybindings
-- ****************************************

Modes.Hyper:bind('', 'space', function() -- quick alt-tab
  hs.eventtap.keyStroke('cmd', 'tab', 80)
  hs.eventtap.keyStroke('', 'return', 80)
end)
Modes.Hyper:bind('', 'tab', function() Utils.yabai_msg('window', 'focus recent') end)
-- Modes.Hyper:bind('', 'h', function() Utils.yabai_msg('window', 'focus west') end)
Modes.Hyper:bind('', 'h', function()
  Utils.yabai_msg('window', 'focus west')
  Utils.window_split_flip()
end)
Modes.Hyper:bind('', 'l', function()
  Utils.yabai_msg('window', 'focus east')
  Utils.window_split_flip()
end)
Modes.Hyper:bind('', 'j', function() Utils.yabai_msg('window', 'focus south') end)
Modes.Hyper:bind('', 'k', function() Utils.yabai_msg('window', 'focus north') end)
Modes.Hyper:bind('', 'm', function() hs.eventtap.keyStroke('', 'cmd', 70) end)

Modes.Hyper:bind('shift', 'x', function()
  Utils.yabai_msg('window', 'close')
  Utils.yabai_msg('window', 'focus last')
end)

Modes.Hyper:bind('shift', 'h', function() Utils.yabai_msg('window', 'swap west') end)
Modes.Hyper:bind('shift', 'l', function() Utils.yabai_msg('window', 'swap east') end)
Modes.Hyper:bind('shift', 'j', function() Utils.yabai_msg('window', 'swap south') end)
Modes.Hyper:bind('shift', 'k', function() Utils.yabai_msg('window', 'swap north') end)

Modes.Hyper:bind({ 'shift', 'alt' }, 'h', function() Utils.move_current_window_to_display('prev') end)
Modes.Hyper:bind({ 'shift', 'alt' }, 'l', function() Utils.move_current_window_to_display('next') end)

Modes.Hyper:bind('alt', 'h', function() Utils.yabai_msg('window', 'warp west') end)
Modes.Hyper:bind('alt', 'l', function() Utils.yabai_msg('window', 'warp east') end)
Modes.Hyper:bind('alt', 'j', function() Utils.yabai_msg('window', 'warp south') end)
Modes.Hyper:bind('alt', 'k', function() Utils.yabai_msg('window', 'warp north') end)

-- Mode.Hyper:bind('cmd', 'l', function() Utils.yabai_msg('window', 'ratio rel:0.05') end)
-- Mode.Hyper:bind('cmd', 'h', function() Utils.yabai_msg('window', 'ratio rel:-0.05') end)
Modes.Hyper:bind('cmd', 'h', function() Utils.yabai_msg('window', 'ratio abs:0.30') end)
Modes.Hyper:bind('cmd', 'l', function() Utils.yabai_msg('window', 'ratio abs:0.70') end)
Modes.Hyper:bind('cmd', ';', function() Utils.yabai_msg('space', 'balance') end)

Modes.Hyper:bind('ctrl', 'h', function() Utils.yabai_msg('window', 'stack west') end)
Modes.Hyper:bind('ctrl', 'l', function() Utils.yabai_msg('window', 'stack east') end)
Modes.Hyper:bind('ctrl', 'j', function() Utils.yabai_msg('window', 'stack south') end)
Modes.Hyper:bind('ctrl', 'k', function() Utils.yabai_msg('window', 'stack north') end)

Modes.Hyper:bind('', 'z', function() Utils.toggle_window_zoom() end)
Modes.Hyper:bind('shift', 'z', function() Utils.yabai_msg('window', 'toggle zoom-fullscreen') end)
Modes.Hyper:bind('alt', 'z', function()
  -- native fullscreen
  hs.eventtap.keyStroke({ 'fn' }, 'f')
end)

-- ****************************************
-- Mode: Hyper Global App Keybindings
-- ****************************************

-- These need to be used judiciously because they burn a key that can be used as
-- a modal trigger key, like 's' to step into HyperSpace for Space related hotkeys.
-- Prefer to put apps in the HyperApp Modes, which only adds an `a` key to the sequence.
-- These bindings should be used for apps that are used constantly.

-- These bindings currently use special character keys that don't burn a potential
-- modal layer key.

-- Not defined here as it's a special case mode and focus combo
-- Mode.Hyper:bind('', 'Enter', FocusTerminal)

Modes.Hyper:bind('', ';', function()
  Utils.launch_hide_or_focus('liquidnote', 'window', '~/git-home/utility-scripts/liquidnote')
end)

Modes.Hyper:bind('', '.', function()
  Utils.launch_hide_or_focus('finder')
end)

Modes.Hyper:bind('', '/', function()
  hs.application.open('safari')
end)

-- this is question mark for help
Modes.Hyper:bind('shift', '/', function()
  Utils.launch_hide_or_focus('dash')
end)

-- ****************************************
-- Mode: Hyper Meta and Modal Trigger Keybindings
-- ****************************************

Hyper:bind('', 'escape', ExitHyper)
-- hyper:bind('', 'F17', exitHyper)

Hyper:bind('', 'a', EnterHyperApp)
Hyper:bind('', 'c', EnterHyperConfig)
Hyper:bind('', 'd', EnterHyperDisplay)
Hyper:bind('', 'o', EnterHyperOpen)
Hyper:bind('', 'p', EnterHyperCleanshot)
Hyper:bind('', 's', EnterHyperSpace)
Hyper:bind('', 't', EnterHyperStack)
Hyper:bind('', 'w', EnterHyperWindow)
Hyper:bind('', 'return', EnterHyperTerminal)

-- ****************************************
-- Mode: Hyper Keybindings
-- ****************************************

Hyper:bind('', 'space', function() -- quick alt-tab
  hs.eventtap.keyStroke('cmd', 'tab', 80)
  hs.eventtap.keyStroke('', 'return', 80)
end)
Hyper:bind('', 'tab', function() YabaiMsg('window', 'focus recent') end)
Hyper:bind('', 'h', function() YabaiMsg('window', 'focus west') end)
Hyper:bind('', 'l', function() YabaiMsg('window', 'focus east') end)
Hyper:bind('', 'j', function() YabaiMsg('window', 'focus south') end)
Hyper:bind('', 'k', function() YabaiMsg('window', 'focus north') end)
Hyper:bind('', 'm', function() hs.eventtap.keyStroke('', 'cmd', 70) end)

Hyper:bind('shift', 'x', function()
  YabaiMsg('window', 'close')
  YabaiMsg('window', 'focus last')
end)

Hyper:bind('shift', 'h', function() YabaiMsg('window', 'swap west') end)
Hyper:bind('shift', 'l', function() YabaiMsg('window', 'swap east') end)
Hyper:bind('shift', 'j', function() YabaiMsg('window', 'swap south') end)
Hyper:bind('shift', 'k', function() YabaiMsg('window', 'swap north') end)

Hyper:bind({ 'shift', 'alt' }, 'h', function() MoveCurrentWindowToDisplay('prev') end)
Hyper:bind({ 'shift', 'alt' }, 'l', function() MoveCurrentWindowToDisplay('next') end)

Hyper:bind('alt', 'h', function() YabaiMsg('window', 'warp west') end)
Hyper:bind('alt', 'l', function() YabaiMsg('window', 'warp east') end)
Hyper:bind('alt', 'j', function() YabaiMsg('window', 'warp south') end)
Hyper:bind('alt', 'k', function() YabaiMsg('window', 'warp north') end)

Hyper:bind('ctrl', 'h', function() YabaiMsg('window', 'stack west') end)
Hyper:bind('ctrl', 'l', function() YabaiMsg('window', 'stack east') end)
Hyper:bind('ctrl', 'j', function() YabaiMsg('window', 'stack south') end)
Hyper:bind('ctrl', 'k', function() YabaiMsg('window', 'stack north') end)

Hyper:bind('', 'z', function() ToggleWindowZoom() end)
Hyper:bind('shift', 'z', function() YabaiMsg('window', 'toggle zoom-fullscreen') end)
Hyper:bind('alt', 'z', function()
  -- native fullscreen
  hs.eventtap.keyStroke({ 'fn' }, 'f')
end)

-- ****************************************
-- Mode: Hyper Global App Keybindings
-- ****************************************

-- These need to be used judiciously because they burn a key that can be used as
-- a modal trigger key, like 's' to step into HyperSpace for Space related hotkeys.
-- Prefer to put apps in the HyperApp mode, which only adds an `a` key to the sequence.
-- These bindings should be used for apps that are used constantly.
-- These bindings currently use special character keys that don't burn a potential
-- modal layer key.
Hyper:bind('', ';', function()
  LaunchHideOrFocus('liquidnote', 'window', '~/git-home/utility-scripts/liquidnote')
end)

Hyper:bind('', '.', function()
  hs.application.open('finder')
end)

Hyper:bind('', '/', function()
  hs.application.open('safari')
end)

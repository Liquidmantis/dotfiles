-- ****************************************
-- Mode: Hyper Meta and Modal Trigger Keybindings
-- ****************************************

hyper:bind('', 'escape', exitHyper)
-- hyper:bind('', 'F17', exitHyper)

hyper:bind('', 'a', enterHyperApp)
hyper:bind('', 'd', enterHyperDisplay)
hyper:bind('', 's', enterHyperSpace)
hyper:bind('', 't', enterHyperStack)
hyper:bind('', 'w', enterHyperWindow)

-- ****************************************
-- Mode: Hyper Keybindings
-- ****************************************

hyper:bind('', 'c', function() yabaiMsg( 'space', 'create' ) end)
hyper:bind('', 'o', function() yabaiMsg( 'window', 'focus recent' ) end)
hyper:bind('', 'h', function() yabaiMsg( 'window', 'focus west' ) end)
hyper:bind('', 'l', function() yabaiMsg( 'window', 'focus east' ) end)
hyper:bind('', 'j', function() yabaiMsg( 'window', 'focus south' ) end)
hyper:bind('', 'k', function() yabaiMsg( 'window', 'focus north' ) end)

hyper:bind('shift', 'x', function()
	yabaiMsg( 'window', 'close' )
	yabaiMsg( 'window', 'focus last' )
end)

hyper:bind('shift', 'h', function() yabaiMsg( 'window', 'swap west' ) end)
hyper:bind('shift', 'l', function() yabaiMsg( 'window', 'swap east' ) end)
hyper:bind('shift', 'j', function() yabaiMsg( 'window', 'swap south' ) end)
hyper:bind('shift', 'k', function() yabaiMsg( 'window', 'swap north' ) end)

hyper:bind({'shift', 'alt'}, 'h', function() MoveCurrentWindowToDisplay('prev') end)
hyper:bind({'shift', 'alt'}, 'l', function() MoveCurrentWindowToDisplay('next') end)

hyper:bind('alt', 'h', function() yabaiMsg( 'window', 'warp west' ) end)
hyper:bind('alt', 'l', function() yabaiMsg( 'window', 'warp east' ) end)
hyper:bind('alt', 'j', function() yabaiMsg( 'window', 'warp south' ) end)
hyper:bind('alt', 'k', function() yabaiMsg( 'window', 'warp north' ) end)

hyper:bind('ctrl', 'h', function() yabaiMsg( 'window', 'stack west' ) end)
hyper:bind('ctrl', 'l', function() yabaiMsg( 'window', 'stack east' ) end)
hyper:bind('ctrl', 'j', function() yabaiMsg( 'window', 'stack south' ) end)
hyper:bind('ctrl', 'k', function() yabaiMsg( 'window', 'stack north' ) end)

hyper:bind('', 'z', function() yabaiMsg( 'window', 'toggle zoom-parent' ) end)
hyper:bind('shift', 'z', function() yabaiMsg( 'window', 'toggle zoom-fullscreen' ) end)
hyper:bind('alt', 'z', function()
	-- native fullscreen
	hs.eventtap.keyStroke({'ctrl', 'cmd'}, 'f')
end)

hyper:bind('', 'return', function()
  exitHyper()
  hs.application.open( 'kitty' )
end)

hyper:bind('', '.', function()
  exitHyper()
  hs.application.open( 'finder' )
end)

function MoveCurrentWindowToDisplay(display)
  local windowId = GetCurrentWindowId()
  yabaiMsg( 'window', string.format('display %s', display) )
  yabaiMsg( 'window', string.format('focus %s', windowId) )
end

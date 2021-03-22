-- ****************************************
-- Mode: Hyper Meta and Modal Trigger Keybindings
-- ****************************************

hyper:bind('', 'escape', exitHyper)
hyper:bind('', 'F17', exitHyper)

hyper:bind('', 'a', enterHyperApp)
hyper:bind('', 'd', enterHyperDisplay)
hyper:bind('', 's', enterHyperSpace)
hyper:bind('', 't', enterHyperStack)
hyper:bind('', 'w', enterHyperWindow)

-- ****************************************
-- Mode: Hyper Keybindings
-- ****************************************

hyper:bind('', 'c', function() yabaiMsg( 'space', 'create' ) exitHyper() end)
hyper:bind('', 'o', function() yabaiMsg( 'window', 'focus recent' ) exitHyper() end)
hyper:bind('', 'h', function() yabaiMsg( 'window', 'focus west' ) exitHyper() end)
hyper:bind('', 'l', function() yabaiMsg( 'window', 'focus east' ) exitHyper() end)
hyper:bind('', 'j', function() yabaiMsg( 'window', 'focus south' ) exitHyper() end)
hyper:bind('', 'k', function() yabaiMsg( 'window', 'focus north' ) exitHyper() end)

hyper:bind('', 'x', function()
	yabaiMsg( 'window', 'close' )
	yabaiMsg( 'window', 'focus last' )
	exitHyper()
end)

hyper:bind('shift', 'h', function() yabaiMsg( 'window', 'swap west' ) exitHyper() end)
hyper:bind('shift', 'l', function() yabaiMsg( 'window', 'swap east' ) exitHyper() end)
hyper:bind('shift', 'j', function() yabaiMsg( 'window', 'swap south' ) exitHyper() end)
hyper:bind('shift', 'k', function() yabaiMsg( 'window', 'swap north' ) exitHyper() end)

hyper:bind('alt', 'h', function() yabaiMsg( 'window', 'warp west' ) exitHyper() end)
hyper:bind('alt', 'l', function() yabaiMsg( 'window', 'warp east' ) exitHyper() end)
hyper:bind('alt', 'j', function() yabaiMsg( 'window', 'warp south' ) exitHyper() end)
hyper:bind('alt', 'k', function() yabaiMsg( 'window', 'warp north' ) exitHyper() end)

hyper:bind('ctrl', 'h', function() yabaiMsg( 'window', 'stack west' ) exitHyper() end)
hyper:bind('ctrl', 'l', function() yabaiMsg( 'window', 'stack east' ) exitHyper() end)
hyper:bind('ctrl', 'j', function() yabaiMsg( 'window', 'stack south' ) exitHyper() end)
hyper:bind('ctrl', 'k', function() yabaiMsg( 'window', 'stack north' ) exitHyper() end)

hyper:bind('', 'z', function() yabaiMsg( 'window', 'toggle zoom-parent' ) exitHyper() end)
hyper:bind('shift', 'z', function() yabaiMsg( 'window', 'toggle zoom-fullscreen' ) exitHyper() end)
hyper:bind('alt', 'z', function()
	-- native fullscreen
	hs.eventtap.keyStroke({'ctrl', 'cmd'}, 'f')
end)

hyper:bind('', 'return', function()
	yabaiMsg( 'space', 'focus 1' )
	hs.application.launchOrFocus('alacritty')
	exitHyper()
end)

-- Trigger KeyMou
hyper:bind('', 'm', function()
	hs.eventtap.keyStroke({'shift', 'ctrl'}, 'tab')
	exitHyper()
end)


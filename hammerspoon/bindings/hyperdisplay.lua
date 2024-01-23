-- ****************************************
-- Mode: HyperDisplay Keybindings
--   this configuration is experimental and not working well
-- ****************************************

HyperDisplay:bind('', 'escape', ExitHyperDisplay)

-- quick toggle displays
HyperDisplay:bind('', 'd', function() YabaiMsg( 'display', 'focus prev', 'focus next' ) ExitHyperDisplay() end)

HyperDisplay:bind('', 'h', function() YabaiMsg( 'display', 'focus prev' ) ExitHyperDisplay() end)
HyperDisplay:bind('', 'l', function() YabaiMsg( 'display', 'focus next' ) ExitHyperDisplay() end)
HyperDisplay:bind('', 'p', function() YabaiMsg( 'display', 'focus prev' ) ExitHyperDisplay() end)
HyperDisplay:bind('', 'n', function() YabaiMsg( 'display', 'focus next' ) ExitHyperDisplay() end)
HyperDisplay:bind('shift', 'l', function() YabaiMsg( 'space', 'display next' ) ExitHyperDisplay() end)
HyperDisplay:bind('shift', 'h', function() YabaiMsg( 'space', 'display prev' ) ExitHyperDisplay() end)


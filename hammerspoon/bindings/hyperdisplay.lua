-- ****************************************
-- Mode: HyperDisplay Keybindings
--   this configuration is experimental and not working well
-- ****************************************

hyperDisplay:bind('', 'escape', exitHyperDisplay)

-- quick toggle displays
hyperDisplay:bind('', 'd', function() yabaiMsg( 'display', 'focus prev', 'focus next' ) exitHyperDisplay() end)

hyperDisplay:bind('', 'h', function() yabaiMsg( 'display', 'focus prev' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'l', function() yabaiMsg( 'display', 'focus next' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'p', function() yabaiMsg( 'display', 'focus prev' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'n', function() yabaiMsg( 'display', 'focus next' ) exitHyperDisplay() end)
hyperDisplay:bind('shift', 'l', function() yabaiMsg( 'space', 'display next' ) exitHyperDisplay() end)
hyperDisplay:bind('shift', 'h', function() yabaiMsg( 'space', 'display prev' ) exitHyperDisplay() end)


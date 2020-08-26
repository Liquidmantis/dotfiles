-- ****************************************
-- Mode: HyperDisplay Keybindings
--   this configuration is experimental and not working well
-- ****************************************

hyperDisplay:bind('', 'escape', exitHyperDisplay)

hyperDisplay:bind('', 'h', function() yabaiMsg( 'display', 'focus prev' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'l', function() yabaiMsg( 'display', 'focus next' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'p', function() yabaiMsg( 'display', 'focus prev' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'n', function() yabaiMsg( 'display', 'focus next' ) exitHyperDisplay() end)
hyperDisplay:bind('shift', '1', function() yabaiMsg( 'space', 'display 1' ) exitHyperDisplay() end)
hyperDisplay:bind('shift', '2', function() yabaiMsg( 'space', 'display 2' ) exitHyperDisplay() end)


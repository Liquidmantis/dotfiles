-- ****************************************
-- Mode: HyperDisplay Keybindings
--   this configuration is experimental and not working well
-- ****************************************

-- quick toggle displays
Modes.HyperDisplay:bind('', 'd',
  function()
    Utils.yabai_msg('display', 'focus prev', 'focus next')
    Modes.ExitHyperDisplay()
  end)

Modes.HyperDisplay:bind('', 'h', function()
  Utils.yabai_msg('display', 'focus prev')
  Modes.ExitHyperDisplay()
end)
Modes.HyperDisplay:bind('', 'l', function()
  Utils.yabai_msg('display', 'focus next')
  Modes.ExitHyperDisplay()
end)
Modes.HyperDisplay:bind('', 'p', function()
  Utils.yabai_msg('display', 'focus prev')
  Modes.ExitHyperDisplay()
end)
Modes.HyperDisplay:bind('', 'n', function()
  Utils.yabai_msg('display', 'focus next')
  Modes.ExitHyperDisplay()
end)
Modes.HyperDisplay:bind('shift', 'l', function()
  Utils.yabai_msg('space', 'display next')
  Modes.ExitHyperDisplay()
end)
Modes.HyperDisplay:bind('shift', 'h', function()
  Utils.yabai_msg('space', 'display prev')
  Modes.ExitHyperDisplay()
end)

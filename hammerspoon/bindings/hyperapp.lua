-- ****************************************
-- Mode: HyperApp Keybindings
-- ****************************************

HyperApp:bind('', 'escape', ExitHyperApp)

HyperApp:bind('', 'r', function()
	ExitHyperApp() -- not strictly needed since HS is reloading
	hs.reload()
end)

HyperApp:bind('', 'n', function()
	ExitHyperApp()
  local result = ShowHideOrFocus( 'Obsidian' )
  print( result )
  if result == 'nil' then
    hs.execute('obsidian')
  end

end)

HyperApp:bind('', 'm', function()
	ExitHyperApp()
	hs.eventtap.keyStroke('ctrl', 'F2') -- toggle menu bar
end)

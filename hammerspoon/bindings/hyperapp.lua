-- ****************************************
-- Mode: HyperApp Keybindings
-- ****************************************

hyperApp:bind('', 'escape', exitHyperApp)
 
hyperApp:bind('', 'r', function()
	exitHyperApp() -- not strictly needed since HS is reloading
	hs.reload()
end)

hyperApp:bind('', 'n', function()
	exitHyperApp()
  local result = showHideOrFocus( 'LiquidNote' )
  print( result )
  if result == 'nil' then
    hs.execute('alacritty')
  end

end)

hyperApp:bind('', 'm', function()
	exitHyperApp()
	hs.eventtap.keyStroke('ctrl', 'F2') -- toggle menu bar
end)

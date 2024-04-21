-- ****************************************
-- Mode: HyperApp Keybindings
-- ****************************************

HyperApp:bind('', 'o', function()
  hs.application.open( 'obsidian' )
end)

HyperApp:bind('', 'k', function()
  hs.application.open( 'kitty' )
  local obs = hs.application.get('obsidian')
  if State.zenMode ~= false then obs:hide() end
end)

HyperApp:bind('', 'm', function()
	hs.eventtap.keyStroke('ctrl', 'F2') -- toggle menu bar
end)

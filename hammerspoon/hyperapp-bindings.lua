-- ****************************************
-- Mode: HyperApp Keybindings
-- ****************************************

hyperApp:bind('', 'escape', exitHyperApp)
hyperApp:bind('', 'r', function()
	exitHyperApp() -- not strictly needed since HS is reloading
	hs.reload()
end)
hyperApp:bind('', 'm', function()
	exitHyperApp()
	hs.eventtap.keyStroke('ctrl', 'F2') -- toggle menu bar
end)


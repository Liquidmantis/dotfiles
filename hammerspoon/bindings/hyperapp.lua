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

local s = hs.hotkey.modal.new()
HyperApp:bind('', 's', function()
  ExitHyperApp()
  s:enter()
end)

s:bind('', 'a', function()
  hs.application.open( 'safari' )
  s:exit()
end)

s:bind('', 'l', function()
  hs.application.open( 'slack' )
  s:exit()
end)

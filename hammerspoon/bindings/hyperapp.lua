-- ****************************************
-- Mode: HyperApp Keybindings
--
-- To support apps having a common first letter, the HyperApp mode uses a number
-- of submodes, like the `S` mode which has bindings for Safari, Slack, and Spotify.
-- ****************************************

-- ****************************************
-- C apps
-- ****************************************
local c = hs.hotkey.modal.new()
HyperApp:bind('', 'c', function()
  ExitHyperApp()
  c:enter()
end)

c:bind('', 'a', function()
  hs.application.open('busycal')
  c:exit()
end)
c:bind('', 'h', function()
  hs.application.open('google chrome')
  print('open chrome')
  c:exit()
end)
-- ****************************************

HyperApp:bind('', 'f', function()
  hs.application.open('finder')
end)

HyperApp:bind('', 'k', function()
  hs.application.open('kitty')
end)

HyperApp:bind('', 'm', function()
  hs.application.open('mimestream')
end)

HyperApp:bind('', 'n', function()
  ShowHideOrFocus('neovide')
end)

HyperApp:bind('', 'o', function()
  hs.application.open('obsidian')
end)

HyperApp:bind('', 'r', function()
  hs.application.open('reminders')
end)

HyperApp:bind('', 'z', function()
  hs.application.open('zoom.us')
end)

-- ****************************************
-- S apps
-- ****************************************
local s = hs.hotkey.modal.new()
HyperApp:bind('', 's', function()
  ExitHyperApp()
  s:enter()
end)

s:bind('', 'a', function()
  hs.application.open('safari')
  s:exit()
end)

s:bind('', 'l', function()
  hs.application.open('slack')
  s:exit()
end)

s:bind('', 'p', function()
  hs.application.open('spotify')
  s:exit()
end)
-- ****************************************+

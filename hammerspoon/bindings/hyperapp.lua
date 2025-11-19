-- ****************************************
-- Mode: HyperApp Keybindings
--
-- To support apps having a common first letter, the HyperApp mode uses a number
-- of submodes, like the `S` mode which has bindings for Safari, Slack, and Spotify.
-- ****************************************

Modes.HyperApp:bind('', 'a', function()
  -- Utils.launch_hide_or_focus('boltai')
  local raycast_link =
  'raycast://extensions/raycast/raycast-ai/ai-chat?context=%7B%22preset%22:%2284E28514-4A3B-49F4-AF8C-492E5CF05FCF%22%7D'
  local command = "open '" .. raycast_link .. "'"
  Utils.launch_hide_or_focus('AI Chat', 'window', command)
end)
-- ****************************************
-- C apps
-- ****************************************
local c = hs.hotkey.modal.new()
Modes.HyperApp:bind('', 'c', function()
  Modes.ExitHyperApp()
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

Modes.HyperApp:bind('', '.', function()
  Utils.launch_hide_or_focus('Activity Monitor')
end)

Modes.HyperApp:bind('', 'd', function()
  Utils.launch_hide_or_focus('dash')
end)

Modes.HyperApp:bind('', 'f', function()
  hs.application.open('finder')
end)

Modes.HyperApp:bind('', 'k', function()
  hs.application.open('kitty')
end)

Modes.HyperApp:bind('', 'm', function()
  hs.application.open('mimestream')
end)

Modes.HyperApp:bind('', 'n', function()
  Utils.launch_hide_or_focus('neovide')
end)

Modes.HyperApp:bind('', 'o', function()
  Utils.launch_hide_or_focus('obsidian')
end)

Modes.HyperApp:bind('', 'r', function()
  Utils.launch_hide_or_focus('reminders')
end)

Modes.HyperApp:bind('', 't', function()
  Utils.launch_hide_or_focus('microsoft teams')
end)

Modes.HyperApp:bind('', 'z', function()
  hs.application.open('zoom.us')
end)

-- ****************************************
-- S apps
-- ****************************************
local s = hs.hotkey.modal.new()
Modes.HyperApp:bind('', 's', function()
  Modes.ExitHyperApp()
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

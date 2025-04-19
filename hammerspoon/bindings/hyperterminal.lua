function FocusTerminal()
  hs.application.open('ghostty')
  local obs = hs.application.get('obsidian')
  if State.zen_mode ~= false then obs:hide() end
end

-- function OpenTmuxSession(session)

Modes.HyperTerminal:bind('', 'm', function()
  hs.eventtap.keyStroke({ 'ctrl' }, 'a')
  hs.eventtap.keyStroke({ 'ctrl', 'alt' }, 'm')
end)

Modes.HyperTerminal:bind('', 'n', function()
  hs.eventtap.keyStroke({ 'ctrl' }, 'a')
  hs.eventtap.keyStroke({ 'ctrl', 'alt' }, 'n')
end)

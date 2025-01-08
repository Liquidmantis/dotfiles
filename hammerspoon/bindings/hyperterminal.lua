function FocusTerminal()
  hs.application.open('ghostty')
  local obs = hs.application.get('obsidian')
  if State.zenMode ~= false then obs:hide() end
end

-- function OpenTmuxSession(session)

HyperTerminal:bind('', 'm', function()
  hs.eventtap.keyStroke({ 'ctrl' }, 'a')
  hs.eventtap.keyStroke({ 'ctrl', 'alt' }, 'm')
end)

HyperTerminal:bind('', 'n', function()
  hs.eventtap.keyStroke({ 'ctrl' }, 'a')
  hs.eventtap.keyStroke({ 'ctrl', 'alt' }, 'n')
end)

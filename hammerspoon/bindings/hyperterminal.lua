function FocusTerminal()
  -- hs.application.open('ghostty')
  Utils.launch_hide_or_focus('ghostty')

  local obs = hs.application.get('obsidian')
  -- State.zen_mode is not a strict boolean, so we need to check for "not false"
  -- since lua doesn't have "truthiness".
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

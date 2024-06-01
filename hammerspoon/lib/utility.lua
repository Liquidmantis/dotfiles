-- **************************************
-- Helper Functions
-- **************************************

function YabaiMsg( scope, param, fallbackParam)
  local planA = string.format("%s -m %s --%s", YabaiPath, scope, param)
  local cmd = ''
  if fallbackParam==nil then
    cmd = planA
  else
    local planB = string.format("%s -m %s --%s", YabaiPath, scope, fallbackParam)
    cmd = string.format("%s || %s", planA, planB)
  end
  print(cmd)
  os.execute(cmd)
end

function YabaiQuery( scope, param )
  local cmd = string.format("%s -m query --%s", YabaiPath, scope)
  if param~=nil then
    cmd = string.format("%s --%s", cmd, param)
  end
  print(cmd)
  local result = hs.execute(cmd)
  return result
end

function GetCurrentWindowId()
  local window = YabaiQuery('windows', 'window')
  local cmd = string.format("echo '%s' | /usr/local/bin/jq .id", window)
  local id = hs.execute(cmd)
  print('Window ID: ', id)
  return id
end

function ShowHideOrFocus( window )
  local targetWindow = hs.window.find( window )
  print('showHideOrFocus on window ' .. window )

  if targetWindow == nil then
    print('did not find match for ' .. window )
    return nil
  end
  if targetWindow == hs.window.focusedWindow() then
    print('minimizing ' .. window )
    targetWindow:minimize()
  else

    print('focusing ' .. window )
    targetWindow:focus()

  end
end

function SetPadding( xScale, yScale )
  local xPad
  local yPad
  local gap

  if xScale == "=" then
    xPad = State.initial.xPad
    yPad = State.initial.yPad
    gap = State.initial.gap
  else
    xPad = xScale * 20
    yPad = yScale * 20
    gap = xPad
  end

  local padChange = string.format('padding abs:%i:%i:%i:%i', yPad, yPad, xPad, xPad)
  local gapChange = string.format('gap abs:%i', gap)
  YabaiMsg( 'space', padChange )
  YabaiMsg( 'space', gapChange )
end

function ToggleZenMode( mode )
  if mode == State.zenMode or mode == 'exit' then
    SetPadding('=','=')
    YabaiMsg( 'space', 'layout bsp' )
    State.zenMode = false
  else
    if mode == 'zen' then
      -- set window to 65% of screen width
      local xPad = math.floor((State.SCREEN_WIDTH * .35 / 2) / 20)
      SetPadding(xPad , 3)
    elseif mode == 'full' then
      SetPadding(3, 2)
    elseif mode == 'wide' then
      -- set window to 75% of screen width
      local xPad = math.floor((State.SCREEN_WIDTH * .25 / 2) / 20)
      SetPadding(xPad , 3)
    elseif mode == 'narrow' then
      SetPadding(35, 3)
    end

    YabaiMsg( 'space', 'layout stack' )
    State.zenMode = mode
  end
end

function MoveCurrentWindowToDisplay(display)
  local windowId = GetCurrentWindowId()
  YabaiMsg( 'window', string.format('display %s', display) )
  YabaiMsg( 'window', string.format('focus %s', windowId) )
end

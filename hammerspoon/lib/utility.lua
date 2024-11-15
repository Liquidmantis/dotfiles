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

function GetCurrentWindowParameter( param )
  local window = YabaiQuery('windows', 'window')
  local cmd = string.format("echo '%s' | %s '.\"%s\"'", window, JqPath, param)
  print(cmd)
  local result = hs.execute(cmd)
  return result
end

function GetCurrentWindowId()
  return GetCurrentWindowParameter('id')
end

function GetCurrentWindowName()
  return GetCurrentWindowParameter('name')
end

function ShowHideOrFocus( window )
  if string.lower(hs.application.frontmostApplication():title()) == string.lower(window) then
    hs.application.frontmostApplication():hide()
  else
    hs.application.launchOrFocus( window )
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

function ToggleWindowZoom()
  YabaiMsg( 'window', 'toggle zoom-parent' )
  SetBordersColor()
end

local function setBordersColor(color)
  hs.execute(string.format("/opt/homebrew/bin/borders active_color=%s", color))
end

function SetBordersColor()
  local isStacked = GetCurrentWindowParameter('stack-index')
  if isStacked then
    isStacked = string.gsub(isStacked, "[\n\r]","")
    if isStacked ~= "0" then
      setBordersColor(BordersStackedColor)
      return
    end
  end

  local isZoomed = GetCurrentWindowParameter('has-parent-zoom')
  print(string.format("Has Parent Zoom: %s", isZoomed))
  if isZoomed then
    isZoomed = string.gsub(isZoomed, "[\n\r]","")
  end

  if isZoomed == "false" then
    setBordersColor(BordersRegularColor)
  else
    setBordersColor(BordersZoomColor)
  end
end



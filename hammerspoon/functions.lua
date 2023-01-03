-- **************************************
-- Modal Functions
-- **************************************

-- When entering Hyper, clear all other modes.
-- This is done when entering so that leaving Hyper
-- after enabling another mode layer doesn't immediately leave that layer.
alertStyle = {
  textSize = 25,
  atScreenEdge = 2,
  radius = 0,
  fillColor = {white = 0.0, alpha = 0.50},
  strokeColor = {white = 0.0, alpha = 0.50},
  strokeWidth = 5,
  fadeInDuration = 0.0,
  fadeOutDuration = 0.0
}

function enterHyper()
  print('[Mode] Hyper enabled')
  hyper:enter()
  exitHyper2()
  exitHyperApp()
  exitHyperDisplay()
  exitHyperSpace()
  exitHyperWindow()
  exitHyperWindowResize()
  -- hyperAlert = hs.alert('  Hyper', alertStyle, 'sticky')
end

function exitHyper()
  print('[Mode] Hyper disabled')
  hyper:exit()
  -- hs.alert.closeSpecific(hyperAlert)
end

-- Mode wrapper functions
-- Hammerspoon wants a function passed and you can't seem to pass 'hyper:exit',
-- for example.  These are deadwood wrappers so you can pass a function reference.
function enterHyper2()
  print('[Mode] Hyper2 enabled')
  exitHyper()
  hyper2:enter()
end
function exitHyper2()
  print('[Mode] Hyper2 disabled')
  hyper2:exit()
end

function enterHyperApp()
  print('[Mode] HyperApp enabled')
  exitHyper()
  hyperApp:enter()
  -- hyperAppAlert = hs.alert('  HyperApp', alertStyle, 'sticky')
end
function exitHyperApp()
  print('[Mode] HyperApp disabled')
  hyperApp:exit()
  -- hs.alert.closeSpecific(hyperAppAlert)
end

function enterHyperDisplay()
  print('[Mode] HyperDisplay enabled')
  exitHyper()
  hyperDisplay:enter()
  -- hyperDisplayAlert = hs.alert('  HyperDisplay', alertStyle, 'sticky')
end
function exitHyperDisplay()
  print('[Mode] HyperDisplay disabled')
  hyperDisplay:exit()
  -- hs.alert.closeSpecific(hyperDisplayAlert)
end

function enterHyperWindow()
  print('[Mode] HyperWindow enabled')
  exitHyper()
  hyperWindow:enter()
end
function exitHyperWindow()
  print('[Mode] HyperWindow disabled')
  hyperWindow:exit()
end

function enterHyperWindowOpen()
  print('[Mode] HyperWindowOpen enabled')
  exitHyperWindow()
  hyperWindowOpen:enter()
end
function exitHyperWindowOpen()
  print('[Mode] HyperWindowOpen disabled')
  hyperWindowOpen:exit()
end

function enterHyperSpace()
  print('[Mode] HyperSpace enabled')
  exitHyper()
  hyperSpace:enter()
end
function exitHyperSpace()
  print('[Mode] HyperSpace disabled')
  hyperSpace:exit()
end

function enterHyperSpaceZen()
  print('[Mode] HyperSpaceZen enabled')
  exitHyper()
  hyperSpaceZen:enter()
end
function exitHyperSpaceZen()
  print('[Mode] HyperSpaceZen disabled')
  hyperSpaceZen:exit()
end

function enterHyperStack()
  print('[Mode] HyperStack enabled')
  exitHyper()
  hyperStack:enter()
end
function exitHyperStack()
  print('[Mode] HyperStack disabled')
  hyperStack:exit()
end

function enterHyperWindowResize()
  print('[Mode] HyperWindowResize enabled')
  exitHyperWindow()
  hyperWindowResize:enter()
end
function exitHyperWindowResize()
  print('[Mode] HyperWindowResize disabled')
  hyperWindowResize:exit()
end

function enterHyperWindowTransparency()
  print('[Mode] HyperWindowTransparency enabled')
  exitHyperWindow()
  hyperWindowTransparency:enter()
end
function exitHyperWindowTransparency()
  print('[Mode] HyperWindowTransparency disabled')
  hyperWindowTransparency:exit()
end

-- **************************************
-- Helper Functions
-- **************************************

function yabaiMsg( scope, param, fallbackParam)
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

function yabaiQuery( scope, param )
  local cmd = string.format("%s -m query --%s", YabaiPath, scope)
  if param~=nil then
    cmd = string.format("%s --%s", cmd, param)
  end
  print(cmd)
  local result = hs.execute(cmd)
  return result
end

function GetCurrentWindowId()
  local window = yabaiQuery('windows', 'window')
  local cmd = string.format("echo '%s' | /usr/local/bin/jq .id", window)
  local id = hs.execute(cmd)
  print('Window ID: ', id)
  return id
end

function showHideOrFocus( window )
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


local init_x_pad = 12
local init_y_pad = 12
local init_gap = 6
local x_pad = init_x_pad
local y_pad = init_y_pad
local gap = init_gap
-- local last_x_pad = x_pad
local last_y_pad = y_pad
-- local last_gap = gap

function setPadding( x_val, y_val )
  if x_val == "=" then
    x_pad = init_x_pad
    y_pad = init_y_pad
    gap = init_gap
  else
    x_pad = x_val * 20
    -- last_x_pad = x_pad

    if y_val == nil then
      y_pad = last_y_pad
    else
      y_pad = y_val * 20
    end
    gap = x_pad
  end

  local pad_change = string.format('padding abs:%i:%i:%i:%i', y_pad, y_pad, x_pad, x_pad)
  local gap_change = string.format('gap abs:%i', gap)
  yabaiMsg( 'space', pad_change )
  yabaiMsg( 'space', gap_change )
end

-- this whole function is due for an idiomatic Lua refactor.  
-- TODO: figure out how to better handle state in Lua to maintain proper functional 
-- programming practices (i.e. pass a state object rather than violating the function
-- boundary by using outer scope variables.
local current_mode = "no_zen"
function toggleZenMode( mode )
  local zen_pad = {}
  if mode == current_mode or mode == 'exit' then
    setPadding('=','=')
    yabaiMsg( 'space', 'layout bsp' )
    current_mode = "no_zen"
  else
    if mode == 'zen' then
      zen_pad.x = 25
      zen_pad.y = 3 
    elseif mode == 'full' then
      zen_pad = { x = 3, y = 3 }
    elseif mode == 'wide' then
      zen_pad = { x = 15, y = 3 }
    elseif mode == 'narrow' then
      zen_pad = { x = 35, y = 3 }
    end 

    setPadding(zen_pad.x, zen_pad.y)
    yabaiMsg( 'space', 'layout stack' )
    current_mode = mode
  end
end


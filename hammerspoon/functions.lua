-- **************************************
-- Modal Functions
-- **************************************

-- When entering Hyper, clear all other modes.
-- This is done when entering so that leaving Hyper
-- after enabling another mode layer doesn't immediately leave that layer.
AlertStyle = {
  textSize = 25,
  atScreenEdge = 2,
  radius = 0,
  fillColor = {white = 0.0, alpha = 0.50},
  strokeColor = {white = 0.0, alpha = 0.50},
  strokeWidth = 5,
  fadeInDuration = 0.0,
  fadeOutDuration = 0.0
}

function EnterHyper()
  print('[Mode] Hyper enabled')
  Hyper:enter()
  ExitHyper2()
  ExitHyperApp()
  ExitHyperDisplay()
  ExitHyperSpace()
  ExitHyperWindow()
  ExitHyperWindowResize()
  -- hyperAlert = hs.alert('  Hyper', alertStyle, 'sticky')
end

function ExitHyper()
  print('[Mode] Hyper disabled')
  Hyper:exit()
  -- hs.alert.closeSpecific(hyperAlert)
end

-- Mode wrapper functions
-- Hammerspoon wants a function passed and you can't seem to pass 'hyper:exit',
-- for example.  These are deadwood wrappers so you can pass a function reference.
function EnterHyper2()
  print('[Mode] Hyper2 enabled')
  ExitHyper()
  Hyper2:enter()
end
function ExitHyper2()
  print('[Mode] Hyper2 disabled')
  Hyper2:exit()
end

function EnterHyperApp()
  print('[Mode] HyperApp enabled')
  ExitHyper()
  HyperApp:enter()
  -- hyperAppAlert = hs.alert('  HyperApp', alertStyle, 'sticky')
end
function ExitHyperApp()
  print('[Mode] HyperApp disabled')
  HyperApp:exit()
  -- hs.alert.closeSpecific(hyperAppAlert)
end

function EnterHyperDisplay()
  print('[Mode] HyperDisplay enabled')
  ExitHyper()
  HyperDisplay:enter()
  -- hyperDisplayAlert = hs.alert('  HyperDisplay', alertStyle, 'sticky')
end
function ExitHyperDisplay()
  print('[Mode] HyperDisplay disabled')
  HyperDisplay:exit()
  -- hs.alert.closeSpecific(hyperDisplayAlert)
end

function EnterHyperWindow()
  print('[Mode] HyperWindow enabled')
  ExitHyper()
  HyperWindow:enter()
end
function ExitHyperWindow()
  print('[Mode] HyperWindow disabled')
  HyperWindow:exit()
end

function EnterHyperWindowOpen()
  print('[Mode] HyperWindowOpen enabled')
  ExitHyperWindow()
  HyperWindowOpen:enter()
end
function ExitHyperWindowOpen()
  print('[Mode] HyperWindowOpen disabled')
  HyperWindowOpen:exit()
end

function EnterHyperSpace()
  print('[Mode] HyperSpace enabled')
  ExitHyper()
  HyperSpace:enter()
end
function ExitHyperSpace()
  print('[Mode] HyperSpace disabled')
  HyperSpace:exit()
end

function EnterHyperSpaceZen()
  print('[Mode] HyperSpaceZen enabled')
  ExitHyper()
  HyperSpaceZen:enter()
end
function ExitHyperSpaceZen()
  print('[Mode] HyperSpaceZen disabled')
  HyperSpaceZen:exit()
end

function EnterHyperStack()
  print('[Mode] HyperStack enabled')
  ExitHyper()
  HyperStack:enter()
end
function ExitHyperStack()
  print('[Mode] HyperStack disabled')
  HyperStack:exit()
end

function EnterHyperWindowResize()
  print('[Mode] HyperWindowResize enabled')
  ExitHyperWindow()
  HyperWindowResize:enter()
end
function ExitHyperWindowResize()
  print('[Mode] HyperWindowResize disabled')
  HyperWindowResize:exit()
end

function EnterHyperWindowTransparency()
  print('[Mode] HyperWindowTransparency enabled')
  ExitHyperWindow()
  HyperWindowTransparency:enter()
end
function ExitHyperWindowTransparency()
  print('[Mode] HyperWindowTransparency disabled')
  HyperWindowTransparency:exit()
end

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


local init_x_pad = 12
local init_y_pad = 12
local init_gap = 6
local x_pad = init_x_pad
local y_pad = init_y_pad
local gap = init_gap
-- local last_x_pad = x_pad
local last_y_pad = y_pad
-- local last_gap = gap

function SetPadding( x_val, y_val )
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
  YabaiMsg( 'space', pad_change )
  YabaiMsg( 'space', gap_change )
end

-- this whole function is due for an idiomatic Lua refactor.  
-- TODO: figure out how to better handle state in Lua to maintain proper functional 
-- programming practices (i.e. pass a state object rather than violating the function
-- boundary by using outer scope variables.
local current_mode = "no_zen"
function ToggleZenMode( mode )
  local zen_pad = {}
  if mode == current_mode or mode == 'exit' then
    SetPadding('=','=')
    YabaiMsg( 'space', 'layout bsp' )
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

    SetPadding(zen_pad.x, zen_pad.y)
    YabaiMsg( 'space', 'layout stack' )
    current_mode = mode
  end
end


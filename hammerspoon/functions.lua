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
  local planA = string.format("%s -m %s --%s", yabaiPath, scope, param)
  local cmd = ''
  if fallbackParam==nil then
    cmd = planA
  else
    local planB = string.format("%s -m %s --%s", yabaiPath, scope, fallbackParam)
    cmd = string.format("%s || %s", planA, planB)
  end
  print(cmd)
  os.execute(cmd)
end

last_x_pad = 12
last_y_pad = 12
last_gap = 6
function setPadding( x_val, y_val )
  if x_val == "=" then
    x_pad = 12
    y_pad = 12
    gap = 6
  else
    x_pad = x_val * 20
    last_x_pad = x_pad

    if y_val == nil then
      y_pad = last_y_pad
    else
      y_pad = y_val * 20
    end

    gap = x_pad
  end

  pad_change = string.format('padding abs:%i:%i:%i:%i', y_pad, y_pad, x_pad, x_pad)
  gap_change = string.format('gap abs:%i', gap)
  yabaiMsg( 'space', pad_change )
  yabaiMsg( 'space', gap_change )
end

zen_mode = false
function toggleZenMode() 
  if zen_mode then
  setPadding('=','=')
  zen_mode = false
  else
  setPadding('25','3')
  zen_mode = true
  end
end


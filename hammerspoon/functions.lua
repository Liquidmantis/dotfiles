-- **************************************
-- Modal Functions
-- **************************************

function ClearModes()
  ExitHyper()
  ExitHyper2()
  ExitHyperApp()
  ExitHyperConfig()
  ExitHyperConfigPadding()
  ExitHyperDisplay()
  ExitHyperSpace()
  ExitHyperSpaceZen()
  ExitHyperWindow()
  ExitHyperWindowResize()
  ExitHyperWindowTransparency()
end

function EnterHyper()
  print('[Mode] Hyper enabled')
  Hyper:enter()
  -- hyperAlert = hs.alert('  Hyper', alertStyle, 'sticky')
end

function ExitHyper()
  print('[Mode] Hyper disabled')
  Hyper:exit()
  -- hs.alert.closeSpecific(hyperAlert)
end

-- Mode wrapper functions
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

function EnterHyperConfig()
  print('[Mode] HyperConfig enabled')
  ExitHyper()
  HyperConfig:enter()
end
function ExitHyperConfig()
  print('[Mode] HyperConfig disabled')
  HyperConfig:exit()
end

function EnterHyperConfigPadding()
  print('[Mode] HyperConfigPadding enabled')
  ExitHyper()
  HyperConfigPadding:enter()
end
function ExitHyperConfigPadding()
  print('[Mode] HyperConfigPadding disabled')
  HyperConfigPadding:exit()
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

-- this whole function is due for an idiomatic Lua refactor.  
-- TODO: figure out how to better handle state in Lua to maintain proper functional 
-- programming practices (i.e. pass a state object rather than violating the function
-- boundary by using outer scope variables.
function ToggleZenMode( mode )
  if mode == State.zenMode or mode == 'exit' then
    SetPadding('=','=')
    YabaiMsg( 'space', 'layout bsp' )
    State.zenMode = false
  else
    if mode == 'zen' then
      SetPadding(25 , 3)
    elseif mode == 'full' then
      SetPadding(3, 2)
    elseif mode == 'wide' then
      SetPadding(15, 3)
    elseif mode == 'narrow' then
      SetPadding(35, 3)
    end

    YabaiMsg( 'space', 'layout stack' )
    State.zenMode = mode
  end
end


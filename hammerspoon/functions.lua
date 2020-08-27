-- **************************************
-- Modal Functions
-- **************************************

-- When entering Hyper, clear all other modes.
-- This is done when entering so that leaving Hyper
-- after enabling another mode layer doesn't immediately leave that layer.
alertStyle = {
    textSize = 25,
    atScreenEdge=2,
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
    -- hyperWindowAlert = hs.alert('  HyperWindow', alertStyle, 'sticky')
end
function exitHyperWindow()
    print('[Mode] HyperWindow disabled')
    hyperWindow:exit()
    -- hs.alert.closeSpecific(hyperWindowAlert)
end

function enterHyperWindowOpen()
    print('[Mode] HyperWindowOpen enabled')
    exitHyperWindow()
    hyperWindowOpen:enter()
    -- hyperWindowOpenAlert = hs.alert('  HyperWindowOpen', alertStyle, 'sticky')
end
function exitHyperWindowOpen()
    print('[Mode] HyperWindowOpen disabled')
    hyperWindowOpen:exit()
    -- hs.alert.closeSpecific(hyperWindowOpenAlert)
end

function enterHyperSpace()
    print('[Mode] HyperSpace enabled')
    exitHyper()
    hyperSpace:enter()
    -- hyperSpaceAlert = hs.alert('  HyperSpace', alertStyle, 'sticky')
end
function exitHyperSpace()
    print('[Mode] HyperWindowSpace disabled')
    hyperSpace:exit()
    -- hs.alert.closeSpecific(hyperSpaceAlert)
end

function enterHyperWindowResize()
    print('[Mode] HyperWindowResize enabled')
    exitHyperWindow()
    hyperWindowResize:enter()
    -- hyperWindowResizeAlert = hs.alert('  HyperWindowResize', alertStyle, 'sticky')
end
function exitHyperWindowResize()
    print('[Mode] HyperWindowResize disabled')
    hyperWindowResize:exit()
    -- hs.alert.closeSpecific(hyperWindowResizeAlert)
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

function setPadding( value )
  pad = value * 20
  -- sides = { "top", "bottom", "left", "right" }
  -- for _, side in next, sides do
  --   os.execute( string.format("%s -m config %s_padding %i", yabaiPath, side, pad))
  -- end
    -- os.execute( string.format("%s -m config window_gap %i", yabaiPath, pad))
    -- os.execute( string.format("%s -m space window_gap %i", yabaiPath, pad))
    padding = string.format('padding abs:%i:%i:%i:%i', pad, pad, pad, pad)
    gap = string.format('gap abs:%i', pad)
    yabaiMsg( 'space', padding )
    yabaiMsg( 'space', gap )
end

-- **************************************
-- Modal Functions
-- **************************************

function ClearModes()
  ExitHyper()
  ExitHyper2()
  ExitHyperApp()
  ExitHyperCleanshot()
  ExitHyperConfig()
  ExitHyperConfigPadding()
  ExitHyperDisplay()
  ExitHyperOpen()
  ExitHyperSpace()
  ExitHyperSpaceZen()
  ExitHyperStack()
  ExitHyperTerminal()
  ExitHyperWindow()
  ExitHyperWindowResize()
  ExitHyperWindowTransparency()
end

function EnterHyper()
  Log.i('[Mode] Hyper enabled')
  Hyper:enter()
  -- hyperAlert = hs.alert('  Hyper', alertStyle, 'sticky')
end

function ExitHyper()
  Log.i('[Mode] Hyper disabled')
  Hyper:exit()
  -- hs.alert.closeSpecific(hyperAlert)
end

-- Mode wrapper functions
function EnterHyper2()
  Log.i('[Mode] Hyper2 enabled')
  ExitHyper()
  Hyper2:enter()
end

function ExitHyper2()
  Log.i('[Mode] Hyper2 disabled')
  Hyper2:exit()
end

function EnterHyperApp()
  Log.i('[Mode] HyperApp enabled')
  ExitHyper()
  HyperApp:enter()
  -- hyperAppAlert = hs.alert('  HyperApp', alertStyle, 'sticky')
end

function ExitHyperApp()
  Log.i('[Mode] HyperApp disabled')
  HyperApp:exit()
  -- hs.alert.closeSpecific(hyperAppAlert)
end

function EnterHyperCleanshot()
  Log.i('[Mode] HyperCleanshot enabled')
  ExitHyper()
  HyperCleanshot:enter()
end

function ExitHyperCleanshot()
  Log.i('[Mode] HyperCleanshot disabled')
  HyperCleanshot:exit()
end

function EnterHyperConfig()
  Log.i('[Mode] HyperConfig enabled')
  ExitHyper()
  HyperConfig:enter()
end

function ExitHyperConfig()
  Log.i('[Mode] HyperConfig disabled')
  HyperConfig:exit()
end

function EnterHyperConfigPadding()
  Log.i('[Mode] HyperConfigPadding enabled')
  ExitHyperConfig()
  HyperConfigPadding:enter()
end

function ExitHyperConfigPadding()
  Log.i('[Mode] HyperConfigPadding disabled')
  HyperConfigPadding:exit()
end

function EnterHyperDisplay()
  Log.i('[Mode] HyperDisplay enabled')
  ExitHyper()
  HyperDisplay:enter()
  -- hyperDisplayAlert = hs.alert('  HyperDisplay', alertStyle, 'sticky')
end

function ExitHyperDisplay()
  Log.i('[Mode] HyperDisplay disabled')
  HyperDisplay:exit()
  -- hs.alert.closeSpecific(hyperDisplayAlert)
end

function EnterHyperOpen()
  Log.i('[Mode] HyperOpen enabled')
  ExitHyper()
  HyperOpen:enter()
end

function ExitHyperOpen()
  Log.i('[Mode] HyperOpen disabled')
  HyperOpen:exit()
end

function EnterHyperWindow()
  Log.i('[Mode] HyperWindow enabled')
  ExitHyper()
  HyperWindow:enter()
end

function ExitHyperWindow()
  Log.i('[Mode] HyperWindow disabled')
  HyperWindow:exit()
end

function EnterHyperWindowOpen()
  Log.i('[Mode] HyperWindowOpen enabled')
  ExitHyperWindow()
  HyperWindowOpen:enter()
end

function ExitHyperWindowOpen()
  Log.i('[Mode] HyperWindowOpen disabled')
  HyperWindowOpen:exit()
end

function EnterHyperSpace()
  Log.i('[Mode] HyperSpace enabled')
  ExitHyper()
  HyperSpace:enter()
end

function ExitHyperSpace()
  Log.i('[Mode] HyperSpace disabled')
  HyperSpace:exit()
end

function EnterHyperSpaceZen()
  Log.i('[Mode] HyperSpaceZen enabled')
  ExitHyper()
  HyperSpaceZen:enter()
end

function ExitHyperSpaceZen()
  Log.i('[Mode] HyperSpaceZen disabled')
  HyperSpaceZen:exit()
end

function EnterHyperStack()
  Log.i('[Mode] HyperStack enabled')
  ExitHyper()
  HyperStack:enter()
end

function ExitHyperStack()
  Log.i('[Mode] HyperStack disabled')
  HyperStack:exit()
end

function EnterHyperTerminal()
  Log.i('[Mode] HyperTerminal enabled')
  FocusTerminal()
  ExitHyper()
  HyperTerminal:enter()
end

function ExitHyperTerminal()
  Log.i('[Mode] HyperTerminal disabled')
  HyperTerminal:exit()
end

function EnterHyperWindowResize()
  Log.i('[Mode] HyperWindowResize enabled')
  ExitHyperWindow()
  HyperWindowResize:enter()
end

function ExitHyperWindowResize()
  Log.i('[Mode] HyperWindowResize disabled')
  HyperWindowResize:exit()
end

function EnterHyperWindowTransparency()
  Log.i('[Mode] HyperWindowTransparency enabled')
  ExitHyperWindow()
  HyperWindowTransparency:enter()
end

function ExitHyperWindowTransparency()
  Log.i('[Mode] HyperWindowTransparency disabled')
  HyperWindowTransparency:exit()
end

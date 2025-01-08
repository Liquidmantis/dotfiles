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

function EnterHyperCleanshot()
  print('[Mode] HyperCleanshot enabled')
  ExitHyper()
  HyperCleanshot:enter()
end

function ExitHyperCleanshot()
  print('[Mode] HyperCleanshot disabled')
  HyperCleanshot:exit()
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
  ExitHyperConfig()
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

function EnterHyperOpen()
  print('[Mode] HyperOpen enabled')
  ExitHyper()
  HyperOpen:enter()
end

function ExitHyperOpen()
  print('[Mode] HyperOpen disabled')
  HyperOpen:exit()
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

function EnterHyperTerminal()
  print('[Mode] HyperTerminal enabled')
  FocusTerminal()
  ExitHyper()
  HyperTerminal:enter()
end

function ExitHyperTerminal()
  print('[Mode] HyperTerminal disabled')
  HyperTerminal:exit()
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

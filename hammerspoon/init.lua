-- The basics of this hyper mode are inspired by
-- https://kalis.me/setup-hyper-key-hammerspoon-macos/

-- Here there be modes.
-- Hyper and Hyper2 are left and right keys for two immediate modes.
-- Hyper and Hyper2 are ephemeral, only active while pressed.
hyper = hs.hotkey.modal.new()
hyper2 = hs.hotkey.modal.new()

-- Mode layers
-- These modes are layered and toggled from Hyper.
-- They "lock" and have exit triggers based on submodes and hotkey triggers.
hyperSpace = hs.hotkey.modal.new()
hyperWindow = hs.hotkey.modal.new()
hyperWindowOpen = hs.hotkey.modal.new()
hyperWindowResize = hs.hotkey.modal.new()
 
-- When entering Hyper, clear all other modes.
-- This is done when entering so that leaving Hyper
-- after enabling another mode layer doesn't immediately leave that layer.
function enterHyper()
	hyper:enter() 
	hyper2:exit()
	hyperSpace:exit()
	hyperWindow:exit()
	hyperWindowOpen:exit()
	hyperWindowResize:exit()
end

function exitHyper() 
	hyper:exit()
end

-- Mode wrapper functions
function enterHyper2() hyper2:enter() end
function exitHyper2() hyper2:exit() end
function enterHyperWindow() hyperWindow:enter() end
function exitHyperWindow() hyperWindow:exit() end
function enterHyperWindowOpen() hyperWindowOpen:enter() end
function exitHyperWindowOpen() hyperWindowOpen:exit() end
function enterHyperSpace() hyperSpace:enter() end
function exitHyperSpace() hyperSpace:exit() end
function enterHyperWindowResize()
	exitHyperWindow()
	hyperWindowResize:enter()
end
function exitHyperWindowResize() hyperWindowResize:exit() end

yabaiPath = "/usr/local/bin/yabai"

function yabaiMsg( scope, param )
	os.execute(string.format("%s -m %s --%s", yabaiPath, scope, param))
end

hs.hotkey.bind({}, 'F17', enterHyper, exitHyper )
hs.hotkey.bind({}, 'F18', enterHyper2, exitHyper2 )

hs.hotkey.bind({'alt'}, 'space', function()
	hs.eventtap.keyStroke({'shift','ctrl','alt','cmd'}, 'space')
end)

-- ****************************************
-- Mode: Hyper Meta and Modal control bindings
-- ****************************************

hyper:bind('', 'escape', function()
  hyper:exit()
end)

hyper:bind('', 'r', function()
	hs.alert('Hammerspoon reloaded')
	hs.reload()
end)

hyper:bind('', 'w', enterHyperWindow)
hyper:bind('', 's', enterHyperSpace)

-- ****************************************
-- Mode: Hyper Keybindings
-- ****************************************

hyper:bind('', 'h', function() 
	yabaiMsg( 'window', 'focus west' )
end)

hyper:bind('', 'l', function()
	yabaiMsg( 'window', 'focus east' )
end)

hyper:bind('', 'j', function()
	yabaiMsg( 'window', 'focus south' )
end)

hyper:bind('', 'k', function()
	yabaiMsg( 'window', 'focus north' )
end)

hyper:bind('', 'x', function()
	yabaiMsg( 'window', 'close' )
	yabaiMsg( 'window', 'focus last' )
end)

hyper:bind('shift', 'h', function()
	yabaiMsg( 'window', 'swap west' )
end)

hyper:bind('shift', 'l', function()
	yabaiMsg( 'window', 'swap east' )
end)

hyper:bind('shift', 'j', function()
	yabaiMsg( 'window', 'swap south' )
end)

hyper:bind('shift', 'k', function()
	yabaiMsg( 'window', 'swap north' )
end)

hyper:bind('alt', 'h', function()
	yabaiMsg( 'window', 'warp west' )
end)

hyper:bind('alt', 'l', function()
	yabaiMsg( 'window', 'warp east' )
end)

hyper:bind('alt', 'j', function()
	yabaiMsg( 'window', 'warp south' )
end)

hyper:bind('alt', 'k', function()
	yabaiMsg( 'window', 'warp north' )
end)

hyper:bind('', 'm', function()
	yabaiMsg( 'window', 'toggle zoom-parent' )
end)

hyper:bind('cmd', 'm', function()
	yabaiMsg( 'window', 'toggle zoom-fullscreen' )
end)

hyper:bind('shift', 'm', function()
	yabaiMsg( 'window', 'toggle native-fullscreen' )
end)
	
hyper:bind('alt', 'n', function()
  os.execute("/usr/local/bin/yabai -m space --focus next")
end)

hyper:bind('alt', 'p', function()
  os.execute("/usr/local/bin/yabai -m space --focus prev")
end)

-- ****************************************
-- Mode: Hyper2 Keybindings
-- ****************************************

hyper2:bind('', '1', function()
  os.execute("/usr/local/bin/yabai -m space --focus 1")
end)

hyper2:bind('', '2', function()
  os.execute("/usr/local/bin/yabai -m space --focus 2")
end)

hyper2:bind('', 'c', function()
  os.execute("/usr/local/bin/yabai -m space --create")
end)

hyper2:bind('shift', '1', function()
  os.execute("/usr/local/bin/yabai -m window --space 1")
end)

hyper2:bind('shift', '2', function()
  os.execute("/usr/local/bin/yabai -m window --space 2")
end)

-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

hyperWindow:bind('', 'Escape', exitHyperWindow)

hyperWindow:bind('', 'o', function()
	hyperWindowOpen:enter()
	hyperWindow:exit()
end)

hyperWindow:bind('', 'r', enterHyperWindowResize)

hyperWindow:bind('', '/', function()
	yabaiMsg( 'window', 'toggle split' )
	hyperWindow:exit()
end)

hyperWindow:bind('', '=', function()
	yabaiMsg( 'window', 'ratio rel:0.05' )
end)

hyperWindow:bind('', '-', function()
	yabaiMsg( 'window', 'ratio rel:-0.05' )
end)

hyperWindow:bind('', 'h', function()
	yabaiMsg( 'window', 'ratio abs:0.30' )
  hyperWindow:exit()
end)

hyperWindow:bind('', 'l', function()
	yabaiMsg( 'window', 'ratio abs:0.70' )
  hyperWindow:exit()
end)

hyperWindow:bind('', '0', function()
  yabaiMsg( 'space', 'balance' )
  hyperWindow:exit()
end)

hyperWindow:bind('', '\\', function()
  yabaiMsg( 'space', 'mirror y-axis' )
  hyperWindow:exit()
end)

hyperWindow:bind('', '-', function()
  yabaiMsg( 'space', 'mirror x-axis' )
  hyperWindow:exit()
end)

-- SubMode: HyperWindowResize Keybindings

hyperWindowResize:bind('', 'Escape', exitHyperWindowResize)

hyperWindowResize:bind('', 'h', function()
	local planA = string.format( "%s -m window --resize right:-30:0", yabaiPath )
	local planB = string.format( "%s -m window --resize left:-30:0", yabaiPath )
	local cmd   = string.format( "%s || %s", planA, planB )
	os.execute(cmd) 
end)

hyperWindowResize:bind('', 'l', function()
	local planA = string.format( "%s -m window --resize right:30:0", yabaiPath )
	local planB = string.format( "%s -m window --resize left:30:0", yabaiPath )
	local cmd   = string.format( "%s || %s", planA, planB )
	os.execute(cmd) 
end)

hyperWindowResize:bind('', 'j', function()
	local planA = string.format( "%s -m window --resize top:0:30", yabaiPath )
	local planB = string.format( "%s -m window --resize bottom:0:30", yabaiPath )
	local cmd   = string.format( "%s || %s", planA, planB )
	os.execute(cmd) 
end)

hyperWindowResize:bind('', 'k', function()
	local planA = string.format( "%s -m window --resize top:0:-30", yabaiPath )
	local planB = string.format( "%s -m window --resize bottom:0:-30", yabaiPath )
	local cmd   = string.format( "%s || %s", planA, planB )
	os.execute(cmd) 
end)

-- SubMode: HyperWindowOpen Keybindings

hyperWindowOpen:bind('', 'Escape', function()
	hyperWindowOpen:exit()
end)

hyperWindowOpen:bind('', 'h', function()
	yabaiMsg( 'window', 'insert west' )
	hyperWindowOpen:exit()
end)

hyperWindowOpen:bind('', 'l', function()
	yabaiMsg( 'window', 'insert east' )
	hyperWindowOpen:exit()
end)

hyperWindowOpen:bind('', 'j', function()
	yabaiMsg( 'window', 'insert south' )
	hyperWindowOpen:exit()
end)

hyperWindowOpen:bind('', 'k', function()
	yabaiMsg( 'window', 'insert north' )
	hyperWindowOpen:exit()
end)

-- ****************************************
-- Mode: HyperSpace Keybindings
-- ****************************************

hyperSpace:bind('', 'h', function()
	os.execute("/usr/local/bin/yabai -m space --focus prev")
end)
hyperSpace:bind('', 'l', function()
	os.execute("/usr/local/bin/yabai -m space --focus next")
end)
hyperSpace:bind('', 'escape', function()
  hyperSpace:exit()
end)

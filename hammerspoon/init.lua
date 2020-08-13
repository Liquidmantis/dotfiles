-- Environmental goodies
yabaiPath = "/usr/local/bin/yabai"

-- Here there be modes.
-- Hyper and Hyper2 are left and right keys for two immediate modes.
-- Hyper and Hyper2 are ephemeral, only active while pressed.
-- Using Karabiner Elements, L-Ctrl and R-Opt are remampped to F17 and F18 respectively
-- these f-keys are bound to the initial hyper triggers so that they can be layered with mod keys
hyper = hs.hotkey.modal.new()
hyper2 = hs.hotkey.modal.new()

-- Mode layers
-- These modes are layered and toggled from Hyper.
-- They "lock" and have exit triggers based on submodes and hotkey triggers.
hyperDisplay= hs.hotkey.modal.new()
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
	hyperDisplay:exit()
	hyperSpace:exit()
	hyperWindow:exit()
	hyperWindowResize:exit()
end

function exitHyper() 
	hyper:exit()
end

-- Mode wrapper functions
-- Hammerspoon wants a function passed and you can't seem to pass 'hyper:exit',
-- for example.  These are deadwood wrappers so you can pass a function reference.
function enterHyper2() hyper2:enter() end
function exitHyper2() hyper2:exit() end
function enterHyperDisplay() hyperDisplay:enter() end
function exitHyperDisplay() hyperDisplay:exit() end
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

-- ****************************************
-- Helper Functions
-- ****************************************

function yabaiMsg( scope, param, fallbackParam)
    local planA = string.format("%s -m %s --%s", yabaiPath, scope, param)
	if fallbackParam then
		local planB = string.format("%s -m %s --%s", yabaiPath, scope, fallbackParam) 
		cmd = string.format("%s || %s", planA, planB)
	else 
		local cmd = planA
	end
		
	os.execute(cmd)
end

-- ****************************************
-- Hyper hotkeys
-- ****************************************

hs.hotkey.bind({}, 'F17', enterHyper, exitHyper )
hs.hotkey.bind({}, 'F18', enterHyper2, exitHyper2 )

-- ****************************************
-- Generic hotkeys
-- ****************************************

-- TODO

-- ****************************************
-- Mode: Hyper Meta and Modal control bindings
-- ****************************************

hyper:bind('', 'escape', exitHyper)

hyper:bind('', 'r', hs.reload)

hyper:bind('', 'w', enterHyperWindow)
hyper:bind('', 's', enterHyperSpace)
hyper:bind('', 'd', enterHyperDisplay)

-- ****************************************
-- Mode: Hyper Keybindings
-- ****************************************

hyper:bind('', 'o', function() yabaiMsg( 'window', 'focus recent' ) end)
hyper:bind('', 'h', function() yabaiMsg( 'window', 'focus west' ) end)
hyper:bind('', 'l', function() yabaiMsg( 'window', 'focus east' ) end)
hyper:bind('', 'j', function() yabaiMsg( 'window', 'focus south' ) end)
hyper:bind('', 'k', function() yabaiMsg( 'window', 'focus north' ) end)

hyper:bind('', 'x', function()
	yabaiMsg( 'window', 'close' )
	yabaiMsg( 'window', 'focus last' )
end)

hyper:bind('shift', 'h', function() yabaiMsg( 'window', 'swap west' ) end)
hyper:bind('shift', 'l', function() yabaiMsg( 'window', 'swap east' ) end)
hyper:bind('shift', 'j', function() yabaiMsg( 'window', 'swap south' ) end)
hyper:bind('shift', 'k', function() yabaiMsg( 'window', 'swap north' ) end)

hyper:bind('alt', 'h', function() yabaiMsg( 'window', 'warp west' ) end)
hyper:bind('alt', 'l', function() yabaiMsg( 'window', 'warp east' ) end)
hyper:bind('alt', 'j', function() yabaiMsg( 'window', 'warp south' ) end)
hyper:bind('alt', 'k', function() yabaiMsg( 'window', 'warp north' ) end)

hyper:bind('', 'm', function() yabaiMsg( 'window', 'toggle zoom-parent' ) end)
hyper:bind('cmd', 'm', function() yabaiMsg( 'window', 'toggle zoom-fullscreen' ) end)
hyper:bind('shift', 'm', function()
	-- this causes a refocus on the original space for some reason.
	-- switching to OS commands.
	-- yabaiMsg( 'window', 'toggle native-fullscreen' )
	hs.eventtap.keyStroke({'ctrl', 'cmd'}, 'f')
end)
	
-- ****************************************
-- Mode: Hyper2 Keybindings
-- ****************************************

hyper2:bind('', '1', function() yabaiMsg( 'space', 'focus 1' ) end)
hyper2:bind('', '2', function() yabaiMsg( 'space', 'focus 2' ) end)
hyper2:bind('', '3', function() yabaiMsg( 'space', 'focus 3' ) end)
hyper2:bind('', '4', function() yabaiMsg( 'space', 'focus 4' ) end)

hyper2:bind('', 'c', function() yabaiMsg( 'space', 'create' ) end)

hyper2:bind('shift', '1', function() yabaiMsg( 'window', 'space 1' ) end)
hyper2:bind('shift', '2', function() yabaiMsg( 'window', 'space 2' ) end)
hyper2:bind('shift', '3', function() yabaiMsg( 'window', 'space 3' ) end)
hyper2:bind('shift', '4', function() yabaiMsg( 'window', 'space 4' ) end)

-- ****************************************
-- Mode: HyperDisplay Keybindings
--   this configuration is experimental and not working well
-- ****************************************

hyperDisplay:bind('', 'Escape', exitHyperDisplay)

hyperDisplay:bind('', 'h', function() yabaiMsg( 'display', 'focus prev' ) hyperDisplay:exit() end)
hyperDisplay:bind('', 'l', function() yabaiMsg( 'display', 'focus next' ) hyperDisplay:exit() end)
hyperDisplay:bind('', 'p', function() yabaiMsg( 'display', 'focus prev' ) hyperDisplay:exit() end)
hyperDisplay:bind('', 'n', function() yabaiMsg( 'display', 'focus next' ) hyperDisplay:exit() end)
hyperDisplay:bind('shift', '1', function() yabaiMsg( 'space', 'display 1' ) hyperDisplay:exit() end)
hyperDisplay:bind('shift', '2', function() yabaiMsg( 'space', 'display 2' ) hyperDisplay:exit() end)

-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

hyperWindow:bind('', 'Escape', exitHyperWindow)

hyperWindow:bind('alt', 'o', function()
	hyperWindowOpen:enter()
	hyperWindow:exit()
end)


hyperWindow:bind('', 'r', function()
	hyperWindowResize:enter()
	hyperWindow:exit()
end)

hyperWindow:bind('', '/', function()
	yabaiMsg( 'window', 'toggle split' )
	hyperWindow:exit()
end)

hyperWindow:bind('', 'f', function() yabaiMsg( 'window', 'toggle float' ) hyperWindow:exit() end)
hyperWindow:bind('', 's', function() yabaiMsg( 'window', 'toggle sticky' ) hyperWindow:exit() end)

hyperWindow:bind('', '=', function() yabaiMsg( 'window', 'ratio rel:0.05' ) end)
hyperWindow:bind('', '-', function() yabaiMsg( 'window', 'ratio rel:-0.05' ) end)
hyperWindow:bind('', 'h', function() yabaiMsg( 'window', 'ratio abs:0.30' ) hyperWindow:exit() end)

hyperWindow:bind('', '0', function() yabaiMsg( 'space', 'balance' ) hyperWindow:exit() end)

hyperWindow:bind('', '\\', function() yabaiMsg( 'space', 'mirror y-axis' ) hyperWindow:exit() end)
hyperWindow:bind('', '-', function() yabaiMsg( 'space', 'mirror x-axis' ) hyperWindow:exit() end)
hyperWindow:bind('', 'o', function() yabaiMsg( 'space', 'rotate 90' ) hyperWindow:exit() end)
hyperWindow:bind('shift', 'o', function() yabaiMsg( 'space', 'rotate 270' ) hyperWindow:exit() end)

-- SubMode: HyperWindowResize Keybindings

hyperWindowResize:bind('', 'escape', exitHyperWindowResize)

-- Yabai window resizing targets an edge that is adjacent to other windows
-- Using the OR operator allows thinking in terms of the division
-- and letting "error handling" conduct the logical operation regardless of 
-- window focus and adjacent edge.
hyperWindowResize:bind('', 'h', function() yabaiMsg( 'window', 'resize right:-30:0', 'resize left:30:0' ) end)
hyperWindowResize:bind('', 'l', function() yabaiMsg( 'window', 'resize left:-30:0', 'resize right:30:0' ) end)
hyperWindowResize:bind('', 'j', function() yabaiMsg( 'window', 'resize top:-30:0', 'resize botton:30:0' ) end)
hyperWindowResize:bind('', 'k', function() yabaiMsg( 'window', 'resize top:30:0', 'resize botton:-30:0' ) end)

-- SubMode: HyperWindowOpen Keybindings

hyperWindowOpen:bind('', 'Escape', exitHyperWindowOpen)

hyperWindowOpen:bind('', 'h', function() yabaiMsg( 'window', 'insert west' ) hyperWindowOpen:exit() end)
hyperWindowOpen:bind('', 'l', function() yabaiMsg( 'window', 'insert east' ) hyperWindowOpen:exit() end)
hyperWindowOpen:bind('', 'j', function() yabaiMsg( 'window', 'insert south' ) hyperWindowOpen:exit() end)
hyperWindowOpen:bind('', 'k', function() yabaiMsg( 'window', 'insert north' ) hyperWindowOpen:exit() end)

-- ****************************************
-- Mode: HyperSpace Keybindings
-- ****************************************

hyperSpace:bind('', 'escape', exitHyperSpace)

hyperSpace:bind('', 'c', function() yabaiMsg( 'space', 'create' ) hyperSpace:exit() end)
hyperSpace:bind('', 'x', function() yabaiMsg( 'space', 'destroy' ) hyperSpace:exit() end)
hyperSpace:bind('', 'o', function() yabaiMsg( 'space', 'focus recent' ) hyperSpace:exit() end)
hyperSpace:bind('', 'h', function() yabaiMsg( 'space', 'focus prev' ) hyperSpace:exit() end)
hyperSpace:bind('', 'l', function() yabaiMsg( 'space', 'focus next' ) hyperSpace:exit() end)
hyperSpace:bind('', 'p', function() yabaiMsg( 'space', 'focus prev' ) hyperSpace:exit() end)
hyperSpace:bind('', 'n', function() yabaiMsg( 'space', 'focus next' ) hyperSpace:exit() end)
hyperSpace:bind('', 'w', function() yabaiMsg( 'space', 'toggle mission-control' ) hyperSpace:exit() end)
hyperSpace:bind('', '1', function() yabaiMsg( 'space', 'focus 1' ) hyperSpace:exit() end)
hyperSpace:bind('', '2', function() yabaiMsg( 'space', 'focus 2' ) hyperSpace:exit() end)
hyperSpace:bind('', '3', function() yabaiMsg( 'space', 'focus 3' ) hyperSpace:exit() end)
hyperSpace:bind('', '4', function() yabaiMsg( 'space', 'focus 4' ) hyperSpace:exit() end)

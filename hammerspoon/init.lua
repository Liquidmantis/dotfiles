require("functions")

hs.notify.show('Hammerspoon', 'Reload Notification', 'Hammerspoon configuration reloaded.')

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
 
-- ****************************************
-- Hyper Keybindings
-- ****************************************

hs.hotkey.bind({}, 'F17', enterHyper, exitHyper)
hs.hotkey.bind({}, 'F18', enterHyper2, exitHyper2)

-- ****************************************
-- Mode: Hyper Meta and Modal Trigger Keybindings
-- ****************************************

hyper:bind('', 'escape', exitHyper)
hyper:bind('', 'r', hs.reload) -- reload Hammerspoon config

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
hyper2:bind('', 'c', function() yabaiMsg( 'space', 'create' ) end)

hyper2:bind('shift', '1', function() yabaiMsg( 'window', 'space 1' ) end)
hyper2:bind('shift', '2', function() yabaiMsg( 'window', 'space 2' ) end)
hyper2:bind('shift', '3', function() yabaiMsg( 'window', 'space 3' ) end)
hyper2:bind('shift', '4', function() yabaiMsg( 'window', 'space 4' ) end)

-- ****************************************
-- Mode: HyperDisplay Keybindings
--   this configuration is experimental and not working well
-- ****************************************

hyperDisplay:bind('', 'escape', exitHyperDisplay)

hyperDisplay:bind('', 'h', function() yabaiMsg( 'display', 'focus prev' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'l', function() yabaiMsg( 'display', 'focus next' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'p', function() yabaiMsg( 'display', 'focus prev' ) exitHyperDisplay() end)
hyperDisplay:bind('', 'n', function() yabaiMsg( 'display', 'focus next' ) exitHyperDisplay() end)
hyperDisplay:bind('shift', '1', function() yabaiMsg( 'space', 'display 1' ) exitHyperDisplay() end)
hyperDisplay:bind('shift', '2', function() yabaiMsg( 'space', 'display 2' ) exitHyperDisplay() end)

-- ****************************************
-- Mode: HyperWindow Keybindings
-- ****************************************

hyperWindow:bind('', 'escape', exitHyperWindow)

hyperWindow:bind('alt', 'o', function()
	enterHyperWindowOpen()
	exitHyperWindow()
end)


hyperWindow:bind('', 'r', function()
	enterHyperWindowResize()
	exitHyperWindow()
end)

hyperWindow:bind('', '/', function()
	yabaiMsg( 'window', 'toggle split' )
	exitHyperWindow()
end)

hyperWindow:bind('', 'f', function() yabaiMsg( 'window', 'toggle float' ) exitHyperWindow() end)
hyperWindow:bind('', 's', function() yabaiMsg( 'window', 'toggle sticky' ) exitHyperWindow() end)

hyperWindow:bind('', '=', function() yabaiMsg( 'window', 'ratio rel:0.05' ) end)
hyperWindow:bind('', '-', function() yabaiMsg( 'window', 'ratio rel:-0.05' ) end)
hyperWindow:bind('', 'h', function() yabaiMsg( 'window', 'ratio abs:0.30' ) exitHyperWindow() end)

hyperWindow:bind('', '0', function() yabaiMsg( 'space', 'balance' ) exitHyperWindow() end)

hyperWindow:bind('', '\\', function() yabaiMsg( 'space', 'mirror y-axis' ) exitHyperWindow() end)
hyperWindow:bind('', '-', function() yabaiMsg( 'space', 'mirror x-axis' ) exitHyperWindow() end)
hyperWindow:bind('', 'o', function() yabaiMsg( 'space', 'rotate 90' ) exitHyperWindow() end)
hyperWindow:bind('shift', 'o', function() yabaiMsg( 'space', 'rotate 270' ) exitHyperWindow() end)

-- SubMode: HyperWindowResize Keybindings

hyperWindowResize:bind('', 'escape', exitHyperWindowResize)

-- Yabai window resizing targets an edge that is adjacent to other windows
-- Using the OR operator allows thinking in terms of the window division
-- and letting "error handling" conduct the logical operation regardless of 
-- window focus and relative internal edge.
hyperWindowResize:bind('', 'h', function() yabaiMsg( 'window', 'resize right:-30:0', 'resize left:30:0' ) end)
hyperWindowResize:bind('', 'l', function() yabaiMsg( 'window', 'resize left:-30:0', 'resize right:30:0' ) end)
hyperWindowResize:bind('', 'j', function() yabaiMsg( 'window', 'resize top:-30:0', 'resize botton:30:0' ) end)
hyperWindowResize:bind('', 'k', function() yabaiMsg( 'window', 'resize top:30:0', 'resize botton:-30:0' ) end)

-- SubMode: HyperWindowOpen Keybindings

hyperWindowOpen:bind('', 'escape', exitHyperWindowOpen)

hyperWindowOpen:bind('', 'h', function() yabaiMsg( 'window', 'insert west' ) exitHyperWindowOpen() end)
hyperWindowOpen:bind('', 'l', function() yabaiMsg( 'window', 'insert east' ) exitHyperWindowOpen() end)
hyperWindowOpen:bind('', 'j', function() yabaiMsg( 'window', 'insert south' ) exitHyperWindowOpen() end)
hyperWindowOpen:bind('', 'k', function() yabaiMsg( 'window', 'insert north' ) exitHyperWindowOpen() end)
hyperSpace:bind('', 'escape', exitHyperSpace)

hyperSpace:bind('', 'c', function() yabaiMsg( 'space', 'create' ) exitHyperSpace() end)
hyperSpace:bind('', 'x', function() yabaiMsg( 'space', 'destroy' ) exitHyperSpace() end)
hyperSpace:bind('', 'o', function() yabaiMsg( 'space', 'focus recent' ) exitHyperSpace() end)
hyperSpace:bind('', 'h', function() yabaiMsg( 'space', 'focus prev' ) exitHyperSpace() end)
hyperSpace:bind('', 'l', function() yabaiMsg( 'space', 'focus next' ) exitHyperSpace() end)
hyperSpace:bind('', 'p', function() yabaiMsg( 'space', 'focus prev', 'focus last' ) exitHyperSpace() end)
hyperSpace:bind('', 'n', function() yabaiMsg( 'space', 'focus next', 'focus first' ) exitHyperSpace() end)
hyperSpace:bind('', 'w', function() yabaiMsg( 'space', 'toggle mission-control' ) exitHyperSpace() end)
hyperSpace:bind('', '1', function() yabaiMsg( 'space', 'focus 1' ) exitHyperSpace() end)
hyperSpace:bind('', '2', function() yabaiMsg( 'space', 'focus 2' ) exitHyperSpace() end)
hyperSpace:bind('', '3', function() yabaiMsg( 'space', 'focus 3' ) exitHyperSpace() end)
hyperSpace:bind('', '4', function() yabaiMsg( 'space', 'focus 4' ) exitHyperSpace() end)

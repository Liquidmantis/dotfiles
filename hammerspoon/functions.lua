-- *****************************************
-- Modal Functions
-- *****************************************

-- When entering Hyper, clear all other modes.
-- This is done when entering so that leaving Hyper
-- after enabling another mode layer doesn't immediately leave that layer.
function enterHyper()
	print('[Mode] Hyper enabled')
	hyper:enter() 
	hyper2:exit()
	hyperDisplay:exit()
	hyperSpace:exit()
	hyperWindow:exit()
	hyperWindowResize:exit()
end

function exitHyper() 
	print('[Mode] Hyper disabled')
	hyper:exit()
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

function enterHyperDisplay() 
	print('[Mode] HyperDisplay enabled')
	exitHyper()
	hyperDisplay:enter()
end
function exitHyperDisplay() 
	print('[Mode] HyperDisplay disabled')
	hyperDisplay:exit() 
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
	print('[Mode] HyperWindowSpace enabled')
	exitHyper()
	hyperSpace:enter()
end
function exitHyperSpace()
	print('[Mode] HyperWindowSpace disabled')
	hyperSpace:exit()
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

-- ****************************************
-- Helper Functions
-- ****************************************

function yabaiMsg( scope, param, fallbackParam)
    local planA = string.format("%s -m %s --%s", yabaiPath, scope, param)
	local cmd = ''
	if fallbackParam==nil then
		cmd = planA
	else 
		local planB = string.format("%s -m %s --%s", yabaiPath, scope, fallbackParam) 
		cmd = string.format("%s || %s", planA, planB)
	end
	os.execute(cmd)
end


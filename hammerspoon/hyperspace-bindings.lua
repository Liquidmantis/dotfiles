-- *******************************
-- Mode: HyperSpace  bindings
-- *******************************

hyperSpace:bind('', 'escape', exitHyperSpace)

-- change space layouts
hyperSpace:bind('', 'b', function() yabaiMsg( 'space', 'layout bsp' ) exitHyperSpace() end)
hyperSpace:bind('', 'f', function() yabaiMsg( 'space', 'layout float' ) exitHyperSpace() end)
hyperSpace:bind('', 's', function() yabaiMsg( 'space', 'layout stack' ) exitHyperSpace() end)

hyperSpace:bind('', 'c', function() yabaiMsg( 'space', 'create' ) exitHyperSpace() end)
hyperSpace:bind('', 'x', function() yabaiMsg( 'space', 'destroy' ) exitHyperSpace() end)

hyperSpace:bind('', '1', function() yabaiMsg( 'space', 'focus 1' ) exitHyperSpace() end)
hyperSpace:bind('', '2', function() yabaiMsg( 'space', 'focus 2' ) exitHyperSpace() end)
hyperSpace:bind('', '3', function() yabaiMsg( 'space', 'focus 3' ) exitHyperSpace() end)
hyperSpace:bind('', '4', function() yabaiMsg( 'space', 'focus 4' ) exitHyperSpace() end)
hyperSpace:bind('', 'o', function() yabaiMsg( 'space', 'focus recent' ) exitHyperSpace() end)
hyperSpace:bind('', 'h', function() yabaiMsg( 'space', 'focus prev' ) exitHyperSpace() end)
hyperSpace:bind('', 'l', function() yabaiMsg( 'space', 'focus next' ) exitHyperSpace() end)
hyperSpace:bind('', 'p', function() yabaiMsg( 'space', 'focus prev', 'focus last' ) exitHyperSpace() end)
hyperSpace:bind('', 'n', function() yabaiMsg( 'space', 'focus next', 'focus first' ) exitHyperSpace() end)

hyperSpace:bind('', 'w', function() yabaiMsg( 'space', 'toggle mission-control' ) exitHyperSpace() end)

hyperSpace:bind('', 'j', function() yabaiMsg( 'window', 'focus stack.next', 'focus stack.prev' ) end)
hyperSpace:bind('', 'k', function() yabaiMsg( 'window', 'focus stack.prev', 'focus stack.next' ) end)

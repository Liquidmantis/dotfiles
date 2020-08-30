require('functions')
require('hs.ipc')
require('modes')
local stackline = rrequire('stackline.stackline.stackline')

stackline.manager:toggleIcons()
hs.notify.show('Hammerspoon', 'Reload Notification', 'Hammerspoon configuration reloaded.')

-- Environmental goodies
yabaiPath = '/usr/local/bin/yabai'

-- source the keybinding files
require('bindings/basic')
require('bindings/hyper')
require('bindings/hyper2')
require('bindings/hyperapp')
require('bindings/hyperdisplay')
require('bindings/hyperspace')
require('bindings/hyperwindow')

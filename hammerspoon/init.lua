require('functions')
require('modes')
require('hs.ipc')

hs.notify.show('Hammerspoon', 'Reload Notification', 'Hammerspoon configuration reloaded.')

-- Environmental goodies
YabaiPath = '/opt/homebrew/bin/yabai'

-- source the keybinding files
require('bindings/basic')
require('bindings/hyper')
require('bindings/hyper2')
require('bindings/hyperapp')
require('bindings/hyperdisplay')
require('bindings/hyperspace')
require('bindings/hyperstack')
require('bindings/hyperwindow')

-- Stackline = require('stackline')
-- Stackline:init()

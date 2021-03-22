require('functions')
require('modes')
require('hs.ipc')

stackline = require('stackline.stackline.stackline')
stackline:init()
stackline.config:toggle("appearance.showIcons")

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
require('bindings/hyperstack')
require('bindings/hyperwindow')

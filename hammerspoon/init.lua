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
require('bindings/hyperconfig')
require('bindings/hyperdisplay')
require('bindings/hyperspace')
require('bindings/hyperstack')
require('bindings/hyperwindow')

-- Stackline = require('stackline')
-- Stackline:init()

-- Configure our initial state values
State = {
  initial = {
    -- These are values that are configured in Yabai's settings
    -- TODO: find out if they can be queried from Yabai rather than duplicated.
    xPad = 12,
    yPad = 12,
    gap = 6
  },
  zenMode = false
}

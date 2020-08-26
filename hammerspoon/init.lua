require('functions')
require('hs.ipc')
require('modes')

hs.notify.show('Hammerspoon', 'Reload Notification', 'Hammerspoon configuration reloaded.')

-- Environmental goodies
yabaiPath = '/usr/local/bin/yabai'

-- source the keybinding files
require('basic-bindings')
require('hyper-bindings')
require('hyper2-bindings')
require('hyperapp-bindings')
require('hyperdisplay-bindings')
require('hyperspace-bindings')
require('hyperwindow-bindings')

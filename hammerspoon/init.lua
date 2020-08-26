require("functions")
require("hs.ipc")

hs.notify.show('Hammerspoon', 'Reload Notification', 'Hammerspoon configuration reloaded.')

-- Environmental goodies
yabaiPath = "/usr/local/bin/yabai"
-- Here there be modes.
-- Hyper and Hyper2 are left and right keys for two immediate modes.
-- Hyper and Hyper2 are ephemeral, only active while pressed.
-- [UPDATE] Hyper is currently sticky
-- Using Karabiner Elements, L-Ctrl and R-Opt are remampped to F17 and F18 respectively
-- these f-keys are bound to the initial hyper triggers so that they can be layered with mod keys
hyper = hs.hotkey.modal.new()
hyper2 = hs.hotkey.modal.new()

-- Mode layers
-- These modes are layered and toggled from Hyper.
-- They "lock" and have exit triggers based on submodes and hotkey triggers.
hyperApp = hs.hotkey.modal.new()
hyperDisplay = hs.hotkey.modal.new()
hyperSpace = hs.hotkey.modal.new()
hyperWindow = hs.hotkey.modal.new()
hyperWindowOpen = hs.hotkey.modal.new()
hyperWindowResize = hs.hotkey.modal.new()

-- ****************************************
-- Hyper Keybindings
-- ****************************************

hs.hotkey.bind({}, 'F17', enterHyper)
hs.hotkey.bind({}, 'F18', enterHyper2, exitHyper2)

-- ****************************************
-- Mode: Hyper Meta and Modal Trigger Keybindings
-- ****************************************

hyper:bind('', 'escape', exitHyper)
hyper:bind('', 'F17', exitHyper)

hyper:bind('', 'a', enterHyperApp)
hyper:bind('', 'd', enterHyperDisplay)
hyper:bind('', 's', enterHyperSpace)
hyper:bind('', 'w', enterHyperWindow)

-- source the keybinding files
require('hyper-bindings')
require('hyper2-bindings')
require('hyperapp-bindings')
require('hyperdisplay-bindings')
require('hyperspace-bindings')
require('hyperwindow-bindings')

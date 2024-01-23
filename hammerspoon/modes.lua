-- Here there be modes.
-- Hyper and Hyper2 are left and right keys for two immediate modes.
-- Hyper and Hyper2 are ephemeral, only active while pressed.
-- [UPDATE] Hyper is currently sticky
-- Using Karabiner Elements, L-Ctrl and R-Opt are remampped to F17 and F18 respectively
-- these f-keys are bound to the initial hyper triggers so that they can be layered with mod keys
Hyper = hs.hotkey.modal.new()
Hyper2 = hs.hotkey.modal.new()

-- Mode layers
-- These modes are layered and toggled from Hyper.
-- They "lock" and have exit triggers based on submodes and hotkey triggers.
HyperApp = hs.hotkey.modal.new()
HyperDisplay = hs.hotkey.modal.new()
HyperSpace = hs.hotkey.modal.new()
HyperSpaceZen = hs.hotkey.modal.new()
HyperStack = hs.hotkey.modal.new()
HyperWindow = hs.hotkey.modal.new()
HyperWindowOpen = hs.hotkey.modal.new()
HyperWindowResize = hs.hotkey.modal.new()
HyperWindowTransparency = hs.hotkey.modal.new()

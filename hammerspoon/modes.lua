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

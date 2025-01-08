-- Here there be modes.
-- Hyper and Hyper2 are ephemeral, only active while pressed.
-- these f-keys are bound to the initial hyper triggers so that they can be layered with mod keys
Hyper = hs.hotkey.modal.new()
Hyper2 = hs.hotkey.modal.new()

-- Mode layers
-- These modes are layered and toggled from Hyper.
-- They "lock" and have exit triggers based on submodes and hotkey triggers.
HyperApp = hs.hotkey.modal.new()
HyperCleanshot = hs.hotkey.modal.new()
HyperConfig = hs.hotkey.modal.new()
HyperConfigPadding = hs.hotkey.modal.new()
HyperDisplay = hs.hotkey.modal.new()
HyperOpen = hs.hotkey.modal.new()
HyperSpace = hs.hotkey.modal.new()
HyperSpaceZen = hs.hotkey.modal.new()
HyperStack = hs.hotkey.modal.new()
HyperTerminal = hs.hotkey.modal.new()
HyperWindow = hs.hotkey.modal.new()
HyperWindowOpen = hs.hotkey.modal.new()
HyperWindowResize = hs.hotkey.modal.new()
HyperWindowTransparency = hs.hotkey.modal.new()

-- ****************************************
-- Mode: HyperOpen Keybindings
-- ****************************************

Modes.HyperOpen:bind('', 'h', function() Utils.yabai_msg('window', 'insert west') end)
Modes.HyperOpen:bind('', 'l', function() Utils.yabai_msg('window', 'insert east') end)
Modes.HyperOpen:bind('', 'j', function() Utils.yabai_msg('window', 'insert south') end)
Modes.HyperOpen:bind('', 'k', function() Utils.yabai_msg('window', 'insert north') end)

Modes.HyperOpen:bind('', 's', function()
  hs.osascript.applescript([[
  tell application "Safari"
    make new document
    activate
  end tell
  ]])
end)

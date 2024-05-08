-- ****************************************
-- Mode: HyperOpen Keybindings
-- ****************************************

HyperOpen:bind('', 'h', function() YabaiMsg( 'window', 'insert west' ) end)
HyperOpen:bind('', 'l', function() YabaiMsg( 'window', 'insert east' ) end)
HyperOpen:bind('', 'j', function() YabaiMsg( 'window', 'insert south' ) end)
HyperOpen:bind('', 'k', function() YabaiMsg( 'window', 'insert north' ) end)

HyperOpen:bind('', 's', function() hs.osascript.applescript([[
  tell application "Safari"
    make new document
    activate
  end tell
  ]])
end)

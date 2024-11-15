require('hs.ipc')
hs.loadSpoon('EmmyLua')

-- Environmental goodies
YabaiPath = '/opt/homebrew/bin/yabai'
JqPath = '/opt/homebrew/bin/jq'

BordersRegularColor = '0xFF10a338'
BordersStackedColor = '0xFFE3F542'
BordersZoomColor = '0xFFFF0000'

-- Configure our initial state values
State = {
  initial = {
    -- These are values that are configured in Yabai's settings
    xPad = 12,
    yPad = 12,
    gap = 12
  },
  SCREEN_WIDTH = hs.screen.primaryScreen():frame().w,
  zenMode = false,
  IS_WORK_COMPUTER = string.match(hs.host.localizedName(), 'will.ernst') and true or false,
}

require('lib/modes')
require('lib/mode-functions')
require('lib/utility')

require('bindings/basic')
require('bindings/hyper')
require('bindings/hyper2')
require('bindings/hyperapp')
require('bindings/hypercleanshot')
require('bindings/hyperconfig')
require('bindings/hyperdisplay')
require('bindings/hyperopen')
require('bindings/hyperspace')
require('bindings/hyperstack')
require('bindings/hyperwindow')

hs.window.filter.default:subscribe(hs.window.filter.windowFocused, SetBordersColor)

hs.notify.show('Hammerspoon', 'Reload Notification', 'Hammerspoon configuration reloaded.')

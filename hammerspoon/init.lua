require('hs.ipc')
hs.loadSpoon('EmmyLua')

Log = hs.logger.new('hs-log', 'warning')

-- Environmental goodies
YABAI_PATH = '/opt/homebrew/bin/yabai'
JQ_PATH = '/opt/homebrew/bin/jq'

BORDERS_REGULAR_COLOR = '0xFF10a338'
BORDERS_STACKED_COLOR = '0xFFE3F542'
BORDERS_ZOOM_COLOR = '0xFFFF0000'

-- Configure our initial state values
State = {
  initial = {
    -- These are values that are configured in Yabai's settings
    -- TODO: read these in to keep them in sync
    x_pad = 12,
    y_pad = 12,
    gap = 12
  },
  SCREEN_WIDTH = hs.screen.primaryScreen():frame().w,
  SCREEN_HEIGHT = hs.screen.primaryScreen():frame().h,
  NOTCH_HEIGHT = hs.screen.primaryScreen():fullFrame().h - hs.screen.primaryScreen():frame().h,
  IS_WORK_COMPUTER = string.match(hs.host.localizedName(), 'will.ernst') and true or false,

  zen_mode = false,
}

require('lib/modes')
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
require('bindings/hyperterminal')
require('bindings/hyperwindow')

-- hs.window.filter.default:subscribe(hs.window.filter.windowFocused, SetBordersColor)

hs.notify.show('Hammerspoon', 'Reload Notification', 'Hammerspoon configuration reloaded.')

-- **************************************
-- Helper Functions
-- **************************************

Utils = {}

function Utils.yabai_msg(scope, param, fallbackParam)
  local planA = string.format("%s -m %s --%s", YABAI_PATH, scope, param)
  local cmd = ''
  if fallbackParam == nil then
    cmd = planA
  else
    local planB = string.format("%s -m %s --%s", YABAI_PATH, scope, fallbackParam)
    cmd = string.format("%s || %s", planA, planB)
  end
  os.execute(cmd)
end

function Utils.yabai_query(scope, param)
  local cmd = string.format("%s -m query --%s", YABAI_PATH, scope)
  if param ~= nil then
    cmd = string.format("%s --%s", cmd, param)
  end
  local result = hs.execute(cmd)
  return result
end

function Utils.get_yabai_entity_parameter(entity, parameter)
  local context = string.format("%ss", entity)
  local e = Utils.yabai_query(context, entity)
  local cmd = string.format("echo '%s' | %s '.\"%s\"'", e, JQ_PATH, parameter)
  local result = hs.execute(cmd)
  if result then
    result = string.gsub(result, "[\n\r\"]", "")
  end
  return result
end

function Utils.trigger_btt(trigger)
  hs.urlevent.openURL("btt://trigger_named/?trigger_name=" .. trigger)
end

function Utils.get_current_space_parameter(param)
  return Utils.get_yabai_entity_parameter('space', param)
end

function Utils.get_current_window_parameter(param)
  return Utils.get_yabai_entity_parameter('window', param)
end

function Utils.get_current_space_type()
  return Utils.get_current_space_parameter('type')
end

function Utils.get_current_window_id()
  return Utils.get_current_window_parameter('id')
end

function Utils.get_current_window_name()
  return Utils.get_current_window_parameter('name')
end

function Utils.launch_hide_or_focus(target, type, launchCommand)
  type = type or 'app'

  if type == 'app' then
    if string.lower(hs.application.frontmostApplication():title()) == string.lower(target) then
      hs.application.frontmostApplication():hide()
    else
      hs.application.launchOrFocus(target)
    end
  else
    if type == 'window' then
      local window = hs.window.find(target)
      if window then
        local focusedWindow = hs.application.frontmostApplication():focusedWindow()
        if focusedWindow == window then
          hs.application.frontmostApplication():hide()
        else
          window:focus()
        end
      else
        hs.execute(launchCommand, true)
      end
    end
  end
end

function Utils.set_padding(xScale, yScale)
  local x_pad
  local y_pad
  local gap

  if xScale == "=" then
    x_pad = State.initial.x_pad
    y_pad = State.initial.y_pad
    gap = State.initial.gap
  else
    x_pad = xScale * 20
    y_pad = yScale * 20
    gap = x_pad
  end

  local pad_change = string.format('padding abs:%i:%i:%i:%i', y_pad, y_pad, x_pad, x_pad)
  local gap_change = string.format('gap abs:%i', gap)
  Utils.yabai_msg('space', pad_change)
  Utils.yabai_msg('space', gap_change)
end

function Utils.toggle_zen_mode(mode)
  if mode == State.zen_mode or mode == 'exit' then
    Utils.set_padding('=', '=')
    Utils.yabai_msg('space', 'layout bsp')
    State.zen_mode = false
  else
    if mode == 'zen' then
      -- set window to 65% of screen width
      local x_pad = math.floor((State.SCREEN_WIDTH * .35 / 2) / 20)
      Utils.set_padding(x_pad, 3)
    elseif mode == 'full' then
      Utils.set_padding(3, 2)
    elseif mode == 'wide' then
      -- set window to 75% of screen width
      local x_pad = math.floor((State.SCREEN_WIDTH * .25 / 2) / 20)
      Utils.set_padding(x_pad, 3)
    elseif mode == 'narrow' then
      Utils.set_padding(35, 3)
    end

    Utils.yabai_msg('space', 'layout stack')
    State.zen_mode = mode
  end
end

function Utils.move_current_window_to_display(display)
  local windowId = Utils.get_current_window_id()
  Utils.yabai_msg('window', string.format('display %s', display))
  Utils.yabai_msg('window', string.format('focus %s', windowId))
end

function Utils.toggle_window_zoom()
  Utils.yabai_msg('window', 'toggle zoom-parent')
  Utils.set_borders_color()
end

function Utils.window_split_flip()
  State.win_split.amount = 100 - State.win_split.amount
  Utils.yabai_msg('window', 'ratio abs:0.' .. State.win_split.amount)
end

local function set_borders_color(color)
  hs.execute(string.format("/opt/homebrew/bin/borders active_color=%s", color))
end

function Utils.set_borders_color()
  local is_stacked = Utils.get_current_window_parameter('stack-index')
  if is_stacked then
    if is_stacked ~= "0" then
      set_borders_color(BORDERS_STACKED_COLOR)
      return
    end
  end

  local is_zoomed = Utils.get_current_window_parameter('has-parent-zoom')
  Log.d(string.format("Has Parent Zoom: %s", is_zoomed))

  if is_zoomed == "false" then
    set_borders_color(BORDERS_REGULAR_COLOR)
  else
    set_borders_color(BORDERS_ZOOM_COLOR)
  end
end

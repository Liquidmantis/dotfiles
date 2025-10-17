-- Modes
-- Here there be modes.

-- Hyper and Hyper2 are ephemeral, only active while pressed, with the expectatin that
-- they are thumb keys and held while symbol keys are sequenced.

-- These f-keys are bound to the initial hyper triggers so that they can be layered with mod keys

-- Mode layers
-- Every mode after Hyper are modes that are layered and toggled from Hyper.
-- They "lock" and have exit triggers based on submodes and when the Hyper key is released.
-- **************************************

Modes = {}

local modes = {
  {
    name = "Hyper",
    enter_extra_funcs = { function() Utils.trigger_btt("enable-mouse-slow") end },
    exit_extra_funcs = { function() Utils.trigger_btt("disable-mouse-slow") end }
  },
  { name = "Hyper2",                  parent = "Hyper" },
  { name = "HyperApp",                parent = "Hyper" },
  { name = "HyperCleanshot",          parent = "Hyper" },
  { name = "HyperConfig",             parent = "Hyper" },
  { name = "HyperConfigPadding",      parent = "HyperConfig" },
  { name = "HyperDisplay",            parent = "Hyper" },
  { name = "HyperOpen",               parent = "Hyper" },
  { name = "HyperSpace",              parent = "Hyper" },
  { name = "HyperSpaceZen",           parent = "Hyper" },
  { name = "HyperStack",              parent = "Hyper" },
  { name = "HyperTerminal",           parent = "Hyper",      enter_extra_funcs = { function() FocusTerminal() end } },
  { name = "HyperWindow",             parent = "Hyper" },
  { name = "HyperWindowMove",         parent = "HyperWindow" },
  { name = "HyperWindowPosition",     parent = "HyperWindow" },
  { name = "HyperWindowResize",       parent = "HyperWindow" },
  { name = "HyperWindowTransparency", parent = "HyperWindow" },
}

local function call_sub_functions(funcs)
  if funcs and type(funcs) == "table" then
    for _, func in ipairs(funcs) do
      func()
    end
  end
end

local function build_mode_functions(mode_name, exit_mode_name, enter_funcs, exit_funcs)
  Modes[mode_name] = hs.hotkey.modal.new()
  Modes["Enter" .. mode_name] = function()
    Log.i(string.format('[Mode] %s enabled', mode_name))
    call_sub_functions(enter_funcs)
    if exit_mode_name then
      Modes["Exit" .. exit_mode_name]()
      call_sub_functions(exit_funcs)
    end
    Modes[mode_name]:enter()
  end

  Modes["Exit" .. mode_name] = function()
    Log.i(string.format('[Mode] %s disabled', mode_name))
    call_sub_functions(exit_funcs)
    Modes[mode_name]:exit()
  end
end

-- Build all mode functions
for _, mode in ipairs(modes) do
  build_mode_functions(mode.name, mode.parent, mode.enter_extra_funcs, mode.exit_extra_funcs)
end

function Modes.clear_modes()
  for _, mode in ipairs(modes) do
    local exit_func = Modes["Exit" .. mode.name]
    if exit_func then exit_func() end
  end
end

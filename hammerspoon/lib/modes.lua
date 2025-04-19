-- **************************************
-- Modes
-- Here there be modes.

-- Hyper and Hyper2 are ephemeral, only active while pressed, with the expectatin that
-- they are thumb keys and held while symbol keys are sequenced.

-- These f-keys are bound to the initial hyper triggers so that they can be layered with mod keys

-- Mode layers
-- Every mode after Hyper are modes that are layered and toggled from Hyper.
-- They "lock" and have exit triggers based on submodes and when the Hyper key is released.
-- **************************************

local modes = {
  { name = "Hyper" },
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
  { name = "HyperTerminal",           parent = "Hyper",      enterExtraFuncs = { function() FocusTerminal() end } },
  { name = "HyperWindow",             parent = "Hyper" },
  { name = "HyperWindowMove",         parent = "HyperWindow" },
  { name = "HyperWindowResize",       parent = "HyperWindow" },
  { name = "HyperWindowTransparency", parent = "HyperWindow" },
}

local function buildModeFunctions(modeName, exitModeName, enterFuncs)
  _G[modeName] = hs.hotkey.modal.new()
  _G["Enter" .. modeName] = function()
    Log.i(string.format('[Mode] %s enabled', modeName))
    if enterFuncs and type(enterFuncs) == "table" then
      for _, func in ipairs(enterFuncs) do
        func()
      end
    end
    if exitModeName then
      _G["Exit" .. exitModeName]()
    end
    _G[modeName]:enter()
  end

  _G["Exit" .. modeName] = function()
    Log.i(string.format('[Mode] %s disabled', modeName))
    _G[modeName]:exit()
  end
end

-- Build all mode functions
for _, mode in ipairs(modes) do
  buildModeFunctions(mode.name, mode.parent, mode.enterExtraFuncs)
end

function ClearModes()
  for _, mode in ipairs(modes) do
    local exitFunc = _G["Exit" .. mode.name]
    if exitFunc then exitFunc() end
  end
end

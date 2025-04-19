local urls = {
  allinone = "cleanshot://all-in-one",
  region = "cleanshot://capture-area",
  fullscreen = "cleanshot://capture-fullscreen",
  history = "cleanshot://open-history",
  scrolling = "cleanshot://scrolling-capture",
  text = "cleanshot://capture-text",
  window = "cleanshot://capture-window",
}

Modes.HyperCleanshot:bind('', 'a', function()
  hs.urlevent.openURL(urls.allinone)
end)

Modes.HyperCleanshot:bind('', 'p', function()
  hs.urlevent.openURL(urls.region)
end)

Modes.HyperCleanshot:bind('', 'f', function()
  hs.urlevent.openURL(urls.fullscreen)
end)

Modes.HyperCleanshot:bind('', 'h', function()
  hs.urlevent.openURL(urls.history)
end)

Modes.HyperCleanshot:bind('', 's', function()
  hs.urlevent.openURL(urls.scrolling)
end)

Modes.HyperCleanshot:bind('', 't', function()
  hs.urlevent.openURL(urls.text)
end)

Modes.HyperCleanshot:bind('', 'w', function()
  hs.urlevent.openURL(urls.window)
end)

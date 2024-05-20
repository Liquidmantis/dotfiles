local urls = {
  allinone = "cleanshot://all-in-one",
  region = "cleanshot://capture-area",
  fullscreen = "cleanshot://capture-fullscreen",
  window = "cleanshot://capture-window",
}

HyperCleanshot:bind('', 'a', function()
  hs.urlevent.openURL(urls.allinone)
end)

HyperCleanshot:bind('', 'p', function()
  hs.urlevent.openURL(urls.region)
end)

HyperCleanshot:bind('', 'f', function()
  hs.urlevent.openURL(urls.fullscreen)
end)

HyperCleanshot:bind('', 'w', function()
  hs.urlevent.openURL(urls.window)
end)

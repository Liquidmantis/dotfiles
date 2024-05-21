local urls = {
  allinone = "cleanshot://all-in-one",
  region = "cleanshot://capture-area",
  fullscreen = "cleanshot://capture-fullscreen",
  history = "cleanshot://open-history",
  scrolling = "cleanshot://scrolling-capture",
  text = "cleanshot://capture-text",
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

HyperCleanshot:bind('', 'h', function()
  hs.urlevent.openURL(urls.history)
end)

HyperCleanshot:bind('', 's', function()
  hs.urlevent.openURL(urls.scrolling)
end)

HyperCleanshot:bind('', 't', function()
  hs.urlevent.openURL(urls.text)
end)

HyperCleanshot:bind('', 'w', function()
  hs.urlevent.openURL(urls.window)
end)

local wm = require('window-management')
local hk = require "hs.hotkey"



-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Move window to screen
windowBind({"ctrl","alt"}, {
  n = wm.throwLeft,
  p = wm.throwRight
})
-- * Set Window Position on screen
windowBind({"ctrl","alt"}, {
  m = wm.maximizeWindow,    -- ⌃⌥⌘ + M
  c = wm.centerOnScreen,    -- ⌃⌥⌘ + C
})
-- * Set Window Position on screen
windowBind({"ctrl", "alt", "cmd"}, {
  left = wm.leftHalf,       -- ⌃⌥⌘ + ←
  right = wm.rightHalf,     -- ⌃⌥⌘ + →
  up = wm.topHalf,          -- ⌃⌥⌘ + ↑
  down = wm.bottomHalf      -- ⌃⌥⌘ + ↓
})
-- * Set Window Position on screen
windowBind({"ctrl", "alt", "shift"}, {
  left = wm.rightToLeft,      -- ⌃⌥⇧ + ←
  right = wm.rightToRight,    -- ⌃⌥⇧ + →
  up = wm.bottomUp,           -- ⌃⌥⇧ + ↑
  down = wm.bottomDown        -- ⌃⌥⇧ + ↓
})
-- * Set Window Position on screen
windowBind({"alt", "cmd", "shift"}, {
  left = wm.leftToLeft,      -- ⌥⌘⇧ + ←
  right = wm.leftToRight,    -- ⌥⌘⇧ + →
  up = wm.topUp,             -- ⌥⌘⇧ + ↑
  down = wm.topDown          -- ⌥⌘⇧ + ↓
})

-- * Windows-like cycle
windowBind({"ctrl","alt"}, {
  u = wm.cycleLeft,          -- ⌃⌥⌘ + u
  i = wm.cycleRight          -- ⌃⌥⌘ + i
})
-- switcher
hs.hotkey.bind({'ctrl', 'alt'}, 'space', function()
  -- hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
  hs.hints.windowHints()
end)

-- 将程序移动到下一个窗口
hs.hotkey.bind({"alt","cmd"}, "h",
   function() wm.moveWindowOneSpace("right") end,
   function() wm.moveWindowOneSpaceEnd("right") end)
hs.hotkey.bind({"alt","cmd"}, "l",
   function() wm.moveWindowOneSpace("left") end,
   function() wm.moveWindowOneSpaceEnd("left") end)

hs.hotkey.bind({}, 'f1', function()
    hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind({}, 'f10', function()
  hs.application.launchOrFocus('Lock Screen Bundle')
end)
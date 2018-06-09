
local obj={}
obj.__index = obj

-- Metadata
obj.name = "keybind"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()

local wm = require('WinWin')
local hk = require "hs.hotkey"

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
  left = wm.leftToLeft,      -- 1™←
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

-- -- 将程序移动到下一个窗口
-- hs.hotkey.bind({"alt","cmd"}, "h",
--    function() wm.moveWindowOneSpace("right") end,
--    function() wm.moveWindowOneSpaceEnd("right") end)
-- hs.hotkey.bind({"alt","cmd"}, "l",
--    function() wm.moveWindowOneSpace("left") end,
--    function() wm.moveWindowOneSpaceEnd("left") end)


hs.hotkey.bind({"ctrl"}, "r", function()
    hs.reload()
  end)
hs.alert.show("Config loaded")

¬hk1 = hs.hotkey.bind({"ctrl","shift"}, "right",
   function() moveWindowOneSpace("right") end,
   function() moveWindowOneSpaceEnd("right") end)
hk2 = hs.hotkey.bind({"ctrl","shift"}, "left",
   function() moveWindowOneSpace("left") end,
   function() moveWindowOneSpaceEnd("left") end)
  

-- spaces.changeToSpace(spaceID, [resetDock]) -> spacesIDArray
hs.hotkey.bind({"ctrl","shift"}, "1", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  -- throw window to space
  throwToSpace(win, 1)

end)
hs.hotkey.bind({"ctrl","shift"}, "2", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  throwToSpace(win, 2)

end)
hs.hotkey.bind({"ctrl","shift"}, "3", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  throwToSpace(win, 3)
	
end)
hs.hotkey.bind({"ctrl","shift"}, "4", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  throwToSpace(win, 4)

end)

return obj

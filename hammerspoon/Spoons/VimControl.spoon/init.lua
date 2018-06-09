local obj={}
obj.__index = obj

local normal = hs.hotkey.modal.new()
local visual = hs.hotkey.modal.new()

-- Metadata
obj.name = "keybind"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
        -- hs.alert.show(state)
    if state == 0 then
        --caffeine:setTitle("I")
        hs.alert.show('Insert mode')

        -- local diskIcon = hs.image.imageFromPath("/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/SidebarRemovableDisk.icns")
        -- caffeine:setIcon("/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/SidebarRemovableDisk.icns")
        -- caffeine:setSize({w=16,h=16});
        -- caffeine:
    elseif state == 1 then
        --caffeine:setTitle("N")
        hs.alert.show('Normal mode')

    elseif state == 2 then
        --caffeine:setTitle("V")
        hs.alert.show('Visual mode')

    end
end


-- function caffeineClicked()
--     setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end


-- if caffeine then
--     caffeine:setClickCallback(caffeineClicked)
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
-- end



function obj:init()
    local function pressFn(mods, key)
        if key == nil then
            key = mods
            mods = {}
        end
    
        return function() hs.eventtap.keyStroke(mods, key, 1000) end
    end
    
    local function remap(mods, key, pressFn)
        hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
    end
    
    
    remap({'ctrl','shift'}, 'n', pressFn({'ctrl'},'left'))
    remap({'ctrl','shift'}, 'p', pressFn({'ctrl'},'right'))
    
    remap({'ctrl'}, 'h', pressFn('left'))
    remap({'ctrl'}, 'j', pressFn('down'))
    remap({'ctrl'}, 'k', pressFn('up'))
    remap({'ctrl'}, 'l', pressFn('right'))
    
    remap({'ctrl', 'shift'}, 'h', pressFn({'shift'}, 'left'))
    remap({'ctrl', 'shift'}, 'j', pressFn({'shift'}, 'down'))
    remap({'ctrl', 'shift'}, 'k', pressFn({'shift'}, 'up'))
    remap({'ctrl', 'shift'}, 'l', pressFn({'shift'}, 'right'))
    
    remap({'ctrl', 'cmd'}, 'h', pressFn({'cmd'}, 'left'))
    remap({'ctrl', 'cmd'}, 'j', pressFn({'cmd'}, 'down'))
    remap({'ctrl', 'cmd'}, 'k', pressFn({'cmd'}, 'up'))
    remap({'ctrl', 'cmd'}, 'l', pressFn({'cmd'}, 'right'))
    
    
    remap({'ctrl', 'shift', 'cmd'}, 'h', pressFn({'shift', 'cmd'}, 'left'))
    remap({'ctrl', 'shift', 'cmd'}, 'j', pressFn({'shift', 'cmd'}, 'down'))
    remap({'ctrl', 'shift', 'cmd'}, 'k', pressFn({'shift', 'cmd'}, 'up'))
    remap({'ctrl', 'shift', 'cmd'}, 'l', pressFn({'shift', 'cmd'}, 'right'))
    
    remap({'ctrl', 'shift', 'alt'}, 'h', pressFn({'shift', 'alt'}, 'left'))
    remap({'ctrl', 'shift', 'alt'}, 'j', pressFn({'shift', 'alt'}, 'down'))
    remap({'ctrl', 'shift', 'alt'}, 'k', pressFn({'shift', 'alt'}, 'up'))
    remap({'ctrl', 'shift', 'alt'}, 'l', pressFn({'shift', 'alt'}, 'right'))
    
    remap({'ctrl', 'cmd', 'alt'}, 'h', pressFn({'cmd', 'alt'}, 'left'))
    remap({'ctrl', 'cmd', 'alt'}, 'j', pressFn({'cmd', 'alt'}, 'down'))
    remap({'ctrl', 'cmd', 'alt'}, 'k', pressFn({'cmd', 'alt'}, 'up'))
    remap({'ctrl', 'cmd', 'alt'}, 'l', pressFn({'cmd', 'alt'}, 'right'))
    
    remap({'ctrl', 'cmd', 'alt', 'shift'}, 'h', pressFn({'cmd', 'alt', 'shift'}, 'left'))
    remap({'ctrl', 'cmd', 'alt', 'shift'}, 'j', pressFn({'cmd', 'alt', 'shift'}, 'down'))
    remap({'ctrl', 'cmd', 'alt', 'shift'}, 'k', pressFn({'cmd', 'alt', 'shift'}, 'up'))
    remap({'ctrl', 'cmd', 'alt', 'shift'}, 'l', pressFn({'cmd', 'alt', 'shift'}, 'right'))
    remap({'alt'}, 'tab', pressFn({'cmd'}, '`'))

end


-- <c-[> - enter Normal mode {{{2
-- I don't remap <esc> because it's too risky
enterNormal = hs.hotkey.bind({"shift"}, "tab", function()
    normal:enter()
    -- hs.alert.show('Normal mode')
    setCaffeineDisplay(1)
end)
-- }}}2

-- Movements {{{2

-- h - move left {{{3
function left() hs.eventtap.keyStroke({}, "Left") end
normal:bind({}, 'h', left, nil, left)
-- }}}3

-- l - move right {{{3
function right() hs.eventtap.keyStroke({}, "Right") end
normal:bind({}, 'l', right, nil, right)
-- }}}3

-- k - move up {{{3
function up() hs.eventtap.keyStroke({}, "Up") end
normal:bind({}, 'k', up, nil, up)
-- }}}3

-- j - move down {{{3
function down() hs.eventtap.keyStroke({}, "Down") end
normal:bind({}, 'j', down, nil, down)
-- }}}3

-- w - move to next word {{{3
function word() hs.eventtap.keyStroke({"alt"}, "Right") end
normal:bind({}, 'w', word, nil, word)
normal:bind({}, 'e', word, nil, word)
-- }}}3

-- b - move to previous word {{{3
function back() hs.eventtap.keyStroke({"alt"}, "Left") end
normal:bind({}, 'b', back, nil, back)
-- }}}3

-- 0, H - move to beginning of line {{{3
normal:bind({}, '0', function()
    hs.eventtap.keyStroke({"cmd"}, "Left")
end)

normal:bind({"shift"}, 'h', function()
    hs.eventtap.keyStroke({"cmd"}, "Left")
end)
-- }}}3

-- $, L - move to end of line {{{3
normal:bind({"shift"}, '4', function()
    hs.eventtap.keyStroke({"cmd"}, "Right")
end)

normal:bind({"shift"}, 'l', function()
    hs.eventtap.keyStroke({"cmd"}, "Right")
end)
-- }}}3

-- g - move to beginning of text {{{3
normal:bind({}, 'g', function()
    hs.eventtap.keyStroke({"cmd"}, "Up")
end)
-- }}}3

-- G - move to end of text {{{3
normal:bind({"shift"}, 'g', function()
    hs.eventtap.keyStroke({"cmd"}, "Down")
end)
-- }}}3

-- z - center cursor {{{3
normal:bind({}, 'z', function()
    hs.eventtap.keyStroke({"ctrl"}, "L")
end)
-- }}}3

-- <c-f> - page down {{{3
normal:bind({"ctrl"}, "f", function()
    hs.eventtap.keyStroke({}, "pagedown")
end)
-- }}}3

-- <c-b> - page up {{{3
normal:bind({"ctrl"}, "b", function()
    hs.eventtap.keyStroke({}, "pageup")
end)
-- }}}3

-- }}}2

-- Insert {{{2

-- i - insert at cursor {{{3
normal:bind({}, 'i', function()
    normal:exit()
    -- hs.alert.show('Insert mode')
    setCaffeineDisplay(0)
end)
-- }}}3

-- I - insert at beggining of line {{{3
normal:bind({"shift"}, 'i', function()
    hs.eventtap.keyStroke({"cmd"}, "Left")
    normal:exit()
    -- hs.alert.show('Insert mode')
    setCaffeineDisplay(0)
end)
-- }}}3

-- a - append after cursor {{{3
normal:bind({}, 'a', function()
    hs.eventtap.keyStroke({}, "Right")
    normal:exit()
    -- hs.alert.show('Insert mode')
    setCaffeineDisplay(0)
end)
-- }}}3

-- A - append to end of line {{{3
normal:bind({"shift"}, 'a', function()
    hs.eventtap.keyStroke({"cmd"}, "Right")
    normal:exit()
    -- hs.alert.show('Insert mode')
    setCaffeineDisplay(0)
end)
-- }}}3

-- o - open new line below cursor {{{3
normal:bind({}, 'o', nil, function()
    local app = hs.application.frontmostApplication()
    if app:name() == "Finder" then
        hs.eventtap.keyStroke({"cmd"}, "o")
    else
        hs.eventtap.keyStroke({"cmd"}, "Right")
        normal:exit()
        hs.eventtap.keyStroke({}, "Return")
        -- hs.alert.show('Insert mode')
        setCaffeineDisplay(0)
    end
end)
-- }}}3

-- O - open new line above cursor {{{3
normal:bind({"shift"}, 'o', nil, function()
    local app = hs.application.frontmostApplication()
    if app:name() == "Finder" then
        hs.eventtap.keyStroke({"cmd", "shift"}, "o")
    else
        hs.eventtap.keyStroke({"cmd"}, "Left")
        normal:exit()
        hs.eventtap.keyStroke({}, "Return")
        hs.eventtap.keyStroke({}, "Up")
        setCaffeineDisplay(0)
        -- hs.alert.show('Insert mode')
    end
end)
-- }}}3

-- }}}2

-- Delete {{{2

-- d - delete character before the cursor {{{3
local function delete()
    hs.eventtap.keyStroke({}, "delete")
end
normal:bind({}, 'd', delete, nil, delete)
-- }}}3

-- x - delete character after the cursor {{{3
local function fndelete()
    hs.eventtap.keyStroke({}, "Right")
    hs.eventtap.keyStroke({}, "delete")
end
normal:bind({}, 'x', fndelete, nil, fndelete)
-- }}}3

-- D - delete until end of line {{{3
normal:bind({"shift"}, 'D', nil, function()
    normal:exit()
    hs.eventtap.keyStroke({"ctrl"}, "k")
    normal:enter()
end)
-- }}}3

-- }}}2

-- : - in Safari, focus address bar; everywhere else, call Alfred {{{2
normal:bind({"shift"}, ';', function()
    local app = hs.application.frontmostApplication()
    if app:name() == "Safari" then
        hs.eventtap.keyStroke({"cmd"}, "l") -- go to address bar
    else
        hs.eventtap.keyStroke({"ctrl"}, "space") -- call Alfred
    end
end)
-- }}}2

-- f, s - call Shortcat {{{2
normal:bind({}, 'f', function()
    normal:exit()
    -- hs.alert.show('Insert mode')
    setCaffeineDisplay(0)
    hs.eventtap.keyStroke({"alt"}, "space")
end)

normal:bind({}, 's', function()
    normal:exit()
    -- hs.alert.show('Insert mode')
    setCaffeineDisplay(0)
    hs.eventtap.keyStroke({"alt"}, "space")
end)
-- }}}2

-- / - search {{{2
normal:bind({}, '/', function() hs.eventtap.keyStroke({"cmd"}, "f") end)
-- }}}2

-- u - undo {{{2
normal:bind({}, 'u', function()
    hs.eventtap.keyStroke({"cmd"}, "z")
end)
-- }}}2

-- <c-r> - redo {{{2
normal:bind({"ctrl"}, 'r', function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "z")
end)
-- }}}2

-- y - yank {{{2
normal:bind({}, 'y', function()
    hs.eventtap.keyStroke({"cmd"}, "c")
end)
-- }}}2

-- p - paste {{{2
normal:bind({}, 'p', function()
    hs.eventtap.keyStroke({"cmd"}, "v")
end)
-- }}}2

-- }}}1

-- v - enter Visual mode {{{2
normal:bind({}, 'v', function() normal:exit() visual:enter() end)
function visual:entered() 
    -- hs.alert.show('Visual mode')
     setCaffeineDisplay(2) end
    normal:exit()
-- }}}2

-- <c-[> - exit Visual mode {{{2
visual:bind({}, 'i', function()
    visual:exit()
    normal:exit()
    hs.eventtap.keyStroke({}, "Right")
    -- hs.alert.show('Normal mode')
    setCaffeineDisplay(0)

end)
-- }}}2

-- Movements {{{2

-- h - move left {{{3
function vleft() hs.eventtap.keyStroke({"shift"}, "Left") end
visual:bind({}, 'h', vleft, nil, vleft)
-- }}}3

-- l - move right {{{3
function vright() hs.eventtap.keyStroke({"shift"}, "Right") end
visual:bind({}, 'l', vright, nil, vright)
-- }}}3

-- k - move up {{{3
function vup() hs.eventtap.keyStroke({"shift"}, "Up") end
visual:bind({}, 'k', vup, nil, vup)
-- }}}3

-- j - move down {{{3
function vdown() hs.eventtap.keyStroke({"shift"}, "Down") end
visual:bind({}, 'j', vdown, nil, vdown)
-- }}}3

-- w - move to next word {{{3
function word() hs.eventtap.keyStroke({"alt", "shift"}, "Right") end
visual:bind({}, 'w', word, nil, word)
visual:bind({}, 'e', word, nil, word)
-- }}}3

-- b - move to previous word {{{3
function back() hs.eventtap.keyStroke({"alt", "shift"}, "Left") end
visual:bind({}, 'b', back, nil, back)
-- }}}3

-- 0, H - move to beginning of line {{{3
visual:bind({}, '0', function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "Left")
end)

visual:bind({"shift"}, 'h', function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "Left")
end)
-- }}}3

-- $, L - move to end of line {{{3
visual:bind({"shift"}, '4', function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "Right")
end)

visual:bind({"shift"}, 'l', function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "Right")
end)
-- }}}3

-- g - move to beginning of text {{{3
visual:bind({}, 'g', function()
    hs.eventtap.keyStroke({"shift", "cmd"}, "Up")
end)
-- }}}3

-- G - move to end of text {{{3
visual:bind({"shift"}, 'g', function()
    hs.eventtap.keyStroke({"shift", "cmd"}, "Down")
end)
-- }}}3

-- }}}2

-- d, x - delete character before the cursor {{{3
visual:bind({}, 'd', delete, nil, delete)
visual:bind({}, 'x', delete, nil, delete)
-- }}}3

-- y - yank {{{2
visual:bind({}, 'y', function()
    hs.eventtap.keyStroke({"cmd"}, "c")
    hs.timer.doAfter(0.1, function()
    visual:exit()
    normal:enter()
    hs.eventtap.keyStroke({}, "Right")
    -- hs.alert.show('Normal mode')
    setCaffeineDisplay(1)

end)
end)
-- }}}2

-- p - paste {{{2
visual:bind({}, 'p', function()
    hs.eventtap.keyStroke({"cmd"}, "v")
    visual:exit()
    normal:enter()
    hs.eventtap.keyStroke({}, "Right")
    -- hs.alert.show('Normal mode')
    setCaffeineDisplay(1)

end)
-- }}}2

-- }}}1

hs.window.filter.new('VimR')-- {{{1
    :subscribe(hs.window.filter.windowFocused,function()
        normal:exit()
        enterNormal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused,function()
        enterNormal:enable()
    end)-- }}}1

hs.window.filter.new('iTerm2')-- {{{1
    :subscribe(hs.window.filter.windowFocused,function()
        normal:exit()
        enterNormal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused,function()
        enterNormal:enable()
    end)-- }}}1

hs.window.filter.new('IntelliJ IDEA')-- {{{1
    :subscribe(hs.window.filter.windowFocused,function()
        normal:exit()
        enterNormal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused,function()
        enterNormal:enable()
    end)-- }}}1

hs.window.filter.new('PyCharm')-- {{{1
    :subscribe(hs.window.filter.windowFocused,function()
        normal:exit()
        enterNormal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused,function()
        enterNormal:enable()
    end)-- }}}1

hs.window.filter.new('DataGrip')-- {{{1
    :subscribe(hs.window.filter.windowFocused,function()
        normal:exit()
        enterNormal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused,function()
        enterNormal:enable()
    end)-- }}}1

hs.window.filter.new('Emacs')-- {{{1
    :subscribe(hs.window.filter.windowFocused,function()
        normal:exit()
        enterNormal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused,function()
        enterNormal:enable()
    end)-- }}}1
return obj

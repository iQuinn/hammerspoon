
local obj={}
obj.__index = obj

-- Metadata
obj.name = "keybind"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
    local hotkey = require 'hs.hotkey'
    local window = require 'hs.window'
    local application = require 'hs.application'
    local key2App = {
        a = 'App Store',
        b = 'Vivaldi',
        d = 'Dash',
        f = 'Finder',
        g = 'Mail',
        i = 'IntelliJ IDEA',
        n = 'NeteaseMusic',
        o = 'Microsoft OneNote',
        p = 'Pycharm',
        q = 'QQ',
        m = 'MarginNote X',
        s = 'Safari',
        t = 'iTerm',
        w = 'WeChat',
        x = 'MacVim'
    }

    for key, app in pairs(key2App) do
        hotkey.bind({"alt"}, key, function()
            --application.launchOrFocus(app)
            toggle_application(app)
        end)
    end


    -- reload
    hotkey.bind({"ctrl"}, 'escape', function() hs.reload() end)

    -- Toggle an application between being the frontmost app, and being hidden
    function toggle_application(_app)
        -- finds a running applications
        local app = application.find(_app)

        if not app then
            -- application not running, launch app
            application.launchOrFocus(_app)
            if application.unhide then
                
            end
            return
        end

        -- application running, toggle hide/unhide
        local mainwin = app:mainWindow()
        if mainwin then
            if true == app:isFrontmost() then
                mainwin:application():hide()
            else
                mainwin:application():activate(true)
                mainwin:application():unhide()
                mainwin:focus()
            end
        else
            -- no windows, maybe hide
            if true == app:hide() then
                -- focus app
                application.launchOrFocus(_app)
            else
                -- nothing to do
            end
        end
    end

end

return obj

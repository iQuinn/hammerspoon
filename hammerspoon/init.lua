-- -----------------------------------------------------------------------
--           ** HammerSpoon Config File by S1ngS1ng with ❤️ **           --
-- -----------------------------------------------------------------------

--   ***   Please refer to README.MD for instructions. Cheers!    ***   --

-- -----------------------------------------------------------------------
--                         ** Something Global **                       --
-- ------------------------------------------------------------------
-- Uncomment this following line if you don't wish to see animations
-- hs.window.animationDuration = 0

-- -----------------------------------------------------------------------
--                            ** Requires **                            --
-- -----------------------------------------------------------------------
-- windows management
-- require "scripts/window-management"
-- require "scripts/key-binding"
-- require "scripts/launch"
-- require "scripts/vimHIJK"
-- require "control-escape"

-- require("double_cmdq_to_quit")
-- require("mouse_key")



-- Define default Spoons which will be loaded later
if not hspoons then
  hspoons = {
      "SpeedMenu",
      -- "FnMate",
      -- "ControlEscape",
      "KeyBind",
      --"Launch",
      "VimControl"
  }
end

-- Load those Spoons
for _, v in pairs(hspoons) do
  if(hspoons == "ControlEscape")
  then
    hs.loadSpoon(v):start()
  else
    hs.loadSpoon(v)
  end
end




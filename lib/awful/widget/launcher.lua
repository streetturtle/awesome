---------------------------------------------------------------------------
-- @author Julien Danjou &lt;julien@danjou.info&gt;
-- @copyright 2008-2009 Julien Danjou
-- @widgetmod awful.widget.launcher
---------------------------------------------------------------------------

local setmetatable = setmetatable
local spawn = require("awful.spawn")
local wbutton = require("awful.widget.button")
local button = require("awful.button")

local launcher = { mt = {} }

--- Create a button widget which will launch a command.
-- @param args Standard widget table arguments, plus image for the image path
-- and command for the command to run on click, or either menu to create menu.
-- @return A launcher widget.
-- @constructorfct awful.widget.launcher
function launcher.new(args)
    if not args.command and not args.menu then return end
    local w = wbutton(args)
    if not w then return end

    if args.command then
        w:add_button(button({}, 1, nil, function () spawn(args.command) end))
    elseif args.menu then
        w:add_button(button({}, 1, nil, function () args.menu:toggle() end))
    end

    return w
end

function launcher.mt:__call(...)
    return launcher.new(...)
end

return setmetatable(launcher, launcher.mt)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

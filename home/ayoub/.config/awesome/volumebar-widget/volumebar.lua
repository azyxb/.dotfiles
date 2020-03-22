-------------------------------------------------
-- Volume Bar Widget for Awesome Window Manager
-- Shows the current volume level

-- @author Ayoub Benaddi
-------------------------------------------------

local awful = require("awful")
local gears = require("gears")
local spawn = require("awful.spawn")
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local GET_VOLUME_CMD = 'amixer get Master'
local INC_VOLUME_CMD = 'amixer set Master 5%+'
local DEC_VOLUME_CMD = 'amixer set Master 5%-'
local TOG_VOLUME_CMD = 'amixer set Master toggle'

local bar_color = "#6666ea"
local mute_color = "#ff0000"
local background_color = "#e0e3e9"

local volumebar_widget = wibox.widget {
    max_value = 1,
    forced_width = 50,
    paddings = 0,
    border_width = 0.5,
    color = bar_color,
    background_color = background_color,
    shape = gears.shape.bar,
    clip = true,
    margins       = {
        top = 8,
        bottom = 8,
    },
    widget = wibox.widget.progressbar
}

local update_graphic = function(widget, stdout, _, _, _)
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    volume = tonumber(string.format("% 3d", volume))

    widget.value = volume / 100;
    widget.color = mute == "off" and mute_color
                                  or bar_color

end

volumebar_widget:connect_signal("button::press", function(_,_,_,button)
    if (button == 4)     then awful.spawn(INC_VOLUME_CMD)
    elseif (button == 5) then awful.spawn(DEC_VOLUME_CMD)
    elseif (button == 1) then awful.spawn(TOG_VOLUME_CMD)
    end

    spawn.easy_async(GET_VOLUME_CMD, function(stdout, stderr, exitreason, exitcode)
    update_graphic(volumebar_widget, stdout, stderr, exitreason, exitcode)
    end)
end)

watch(GET_VOLUME_CMD, 1, update_graphic, volumebar_widget)

return volumebar_widget

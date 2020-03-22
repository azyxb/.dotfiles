--[[
   theme.lua
          ___           ___           ___           ___           ___     
         /\__\         |\__\         /\  \         /\__\         /\  \    
        /::|  |        |:|  |        \:\  \       /:/  /        /::\  \   
       /:|:|  |        |:|  |         \:\  \     /:/__/        /:/\:\  \  
      /:/|:|__|__      |:|__|__       /::\  \   /::\  \ ___   /::\~\:\  \ 
     /:/ |::::\__\     /::::\__\     /:/\:\__\ /:/\:\  /\__\ /:/\:\ \:\__\
     \/__/~~/:/  /    /:/~~/~       /:/  \/__/ \/__\:\/:/  / \:\~\:\ \/__/
           /:/  /    /:/  /        /:/  /           \::/  /   \:\ \:\__\  
          /:/  /     \/__/         \/__/            /:/  /     \:\ \/__/  
         /:/  /                                    /:/  /       \:\__\    
         \/__/                                     \/__/         \/__/    
--]]


--------------------------------------
--    "Mythe[eme]" awesome theme    --
--          By Ayoub Benaddi        --
-------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "dina 8"

theme.bg_normal     = "#030303"
theme.bg_focus      = "#030303"
theme.bg_urgent     = "#030303"
theme.bg_minimize   = "#030303"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#D8D8D8"
theme.fg_focus      = "#54487A"
theme.fg_urgent     = "#FF0000"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#D8D8D8"
theme.border_focus  = "#54487A"
theme.border_marked = "#FF0000"

theme.tasklist_disable_icon = true

-- There are other variable sets
-- overriding the mythe one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

--[[ Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)]]

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/ayoub/.config/awesome/themes/mythe/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/ayoub/.config/awesome/themes/mythe/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = "/home/ayoub/.config/awesome/themes/mythe/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/ayoub/.config/awesome/themes/mythe/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/ayoub/.config/awesome/themes/mythe/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/ayoub/.config/awesome/themes/mythe/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/ayoub/.config/awesome/themes/mythe/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/ayoub/.config/awesome/themes/mythe/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/ayoub/.config/awesome/themes/mythe/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/ayoub/.config/awesome/themes/mythe/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/ayoub/.config/awesome/themes/mythe/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/ayoub/.config/awesome/themes/mythe/titlebar/maximized_focus_active.png"

-- I set it with the rc.lua
--- theme.wallpaper = "/home/ayoub/Pictures/minimalistic-gentoo-cows-ufo-abduction-alien.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/ayoub/.config/awesome/themes/mythe/layouts/fairhw.png"
theme.layout_fairv = "/home/ayoub/.config/awesome/themes/mythe/layouts/fairvw.png"
theme.layout_floating  = "/home/ayoub/.config/awesome/themes/mythe/layouts/floatingw.png"
theme.layout_magnifier = "/home/ayoub/.config/awesome/themes/mythe/layouts/magnifierw.png"
theme.layout_max = "/home/ayoub/.config/awesome/themes/mythe/layouts/maxw.png"
theme.layout_fullscreen = "/home/ayoub/.config/awesome/themes/mythe/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/ayoub/.config/awesome/themes/mythe/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/ayoub/.config/awesome/themes/mythe/layouts/tileleftw.png"
theme.layout_tile = "/home/ayoub/.config/awesome/themes/mythe/layouts/tilew.png"
theme.layout_tiletop = "/home/ayoub/.config/awesome/themes/mythe/layouts/tiletopw.png"
theme.layout_spiral  = "/home/ayoub/.config/awesome/themes/mythe/layouts/spiralw.png"
theme.layout_dwindle = "/home/ayoub/.config/awesome/themes/mythe/layouts/dwindlew.png"
theme.layout_cornernw = "/home/ayoub/.config/awesome/themes/mythe/layouts/cornernww.png"
theme.layout_cornerne = "/home/ayoub/.config/awesome/themes/mythe/layouts/cornernew.png"
theme.layout_cornersw = "/home/ayoub/.config/awesome/themes/mythe/layouts/cornersww.png"
theme.layout_cornerse = "/home/ayoub/.config/awesome/themes/mythe/layouts/cornersew.png"

-- Display the taglist squares
theme.taglist_squares_sel = "/home/ayoub/.config/awesome/themes/mythe/layouts/square_sel.png"
theme.taglist_squares_unsel  = "/home/ayoub/.config/awesome/themes/mythe/layouts/square_unsel.png"
theme.taglist_spacing = dpi(2)
-- theme.taglist_squares_sel = nil
-- theme.taglist_squares_unsel = nil
theme.taglist_squares_sel_empty = nil

-- Submenu
theme.menu_submenu_icon = "/home/ayoub/.config/awesome/themes/mythe/layouts/submenu.png"

-- awesome icon
theme.awesome_icon = "/home/ayoub/.config/awesome/themes/mythe/awesome-icon.png"

--[[ Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)
]]--
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

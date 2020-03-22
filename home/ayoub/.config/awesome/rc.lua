--[[
	theme.lua
   
        ___           ___           ___           ___           ___           ___           ___     
       /\  \         /\__\         /\  \         /\  \         /\  \         /\__\         /\  \    
      /::\  \       /:/ _/_       /::\  \       /::\  \       /::\  \       /::|  |       /::\  \   
     /:/\:\  \     /:/ /\__\     /:/\:\  \     /:/\ \  \     /:/\:\  \     /:|:|  |      /:/\:\  \  
    /::\~\:\  \   /:/ /:/ _/_   /::\~\:\  \   _\:\~\ \  \   /:/  \:\  \   /:/|:|__|__   /::\~\:\  \ 
   /:/\:\ \:\__\ /:/_/:/ /\__\ /:/\:\ \:\__\ /\ \:\ \ \__\ /:/__/ \:\__\ /:/ |::::\__\ /:/\:\ \:\__\
   \/__\:\/:/  / \:\/:/ /:/  / \:\~\:\ \/__/ \:\ \:\ \/__/ \:\  \ /:/  / \/__/~~/:/  / \:\~\:\ \/__/
        \::/  /   \::/_/:/  /   \:\ \:\__\    \:\ \:\__\    \:\  /:/  /        /:/  /   \:\ \:\__\  
        /:/  /     \:\/:/  /     \:\ \/__/     \:\/:/  /     \:\/:/  /        /:/  /     \:\ \/__/  
       /:/  /       \::/  /       \:\__\        \::/  /       \::/  /        /:/  /       \:\__\    
       \/__/         \/__/         \/__/         \/__/         \/__/         \/__/  azyxb  \/__/    
--]]
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Volume, battery and brightness
local volumebar_widget = require("volumebar-widget.volumebar")
local brightness_widget = require("brightness-widget.brightness")
local vicious = require("vicious")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Okay, Houston, we've had a problem here!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Okay, Houston, we've had a problem here!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/ayoub/.config/awesome/themes/mythe/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "/usr/bin/st -g 140x30"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.max,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end}
}
dev = {
    { "Ginny", "geany" },
    { "python", terminal .. " -e python" },
    { "lua", terminal .. " -e lua" },
    { "nano", terminal .. " -e nano" },
    { "vim", terminal .. " -e vim" },
    { "emacs", "emacs" },
}
graphics = {
    { "GIMP", "/usr/bin/gimp -n" },
}
network = {
    { "firefox", "firefox" },
}
shell = {
    { "ranger", "/usr/bin/st -g 150x50 -e /usr/bin/ranger" },
    { "st", terminal },
}
system = {
    { "htop", terminal .. " -e htop" },
}
science = {
    { "python", terminal .. " -e python" },
}
scrot = {
    { "scrot", "scrot" },
    { "scrot d", "scrot -d 15" },
}
volume = {
    { "up", "amixer set Master 50%+" },
    { "down", "amixer set Master 50%-" },
    { "toggle", "amixer set Master toggle" },
}
oexit = {
    { "shutdown", "sudo poweroff" },
    { "restart", "sudo reboot" },
}
oportage = {
	 { "make.conf", terminal .. " -e sudoedit /etc/portage/make.conf" },
     { "acc_kw", terminal .. " -e sudoedit /etc/portage/package.accept_keywords" },
     { "p.env", terminal .. " -e sudoedit /etc/portage/package.env" },
     { "p.liscence", terminal .. " -e sudoedit /etc/portage/package.license" },
     { "p.mask", terminal .. " -e sudoedit /etc/portage/package.mask" },
     { "p.use", terminal .. " -e sudoedit /etc/portage/package.use" },
 }
conf = {
     { "vim", terminal .. " -e vim /home/ayoub/.vimrc" },
     { "geany", terminal .. " -e vim /home/ayoub/.config/geany/geany.conf" },
     { "bashrc", terminal .. " -e vim /home/ayoub/.bashrc" },
     { "Theme", terminal .. " -e vim /home/ayoub/.config/awesome/themes/mythe/theme.lua" },
     { "zshrc", terminal .. " -e vim /home/ayoub/.zshrc" },
     { "awesome", terminal .. " -e vim /home/ayoub/.config/awesome/rc.lua" },
     { "portage", oportage},
     
}
ghostss = {
    { "run", "/usr/bin/st -g 78x16 -e sh -c '/home/ayoub/Scripts/color-scripts/ghosts | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/ghosts" },
          }
Arch = {
    { "run", "/usr/bin/st -g 92x12 -e sh -c '/home/ayoub/Scripts/color-scripts/arch | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/arch" },
          }
DNA = {
    { "run", "/usr/bin/st -g 54x31 -e sh -c '/home/ayoub/Scripts/color-scripts/dna | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/dna" },
}
PacMan = {
    { "run", "/usr/bin/st -g 98x21 -e sh -c '/home/ayoub/Scripts/color-scripts/pacman | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/pacman" },
}
Pipes = {
    { "run", "/usr/bin/st -g 78x16 -e sh -c '/home/ayoub/Scripts/color-scripts/pipes2 | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/pipes2" },
}
Rally = {
    { "run", "/usr/bin/st -g 80x22 -e sh -c '/home/ayoub/Scripts/color-scripts/rally-x | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/rally-x" },
}
TheBat = {
    { "run", "/usr/bin/st -g 90x15 -e sh -c '/home/ayoub/Scripts/color-scripts/thebat2 | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/thebat2" },
}
illumina = {
    { "run", "/usr/bin/st -g 40x18 -e sh -c '/home/ayoub/Scripts/color-scripts/illumina | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/illumina" },
}
spectrum = {
    { "run", "/usr/bin/st -g 40x18 -e sh -c '/home/ayoub/Scripts/color-scripts/spectrum | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/spectrum" },
}
dotx = {
    { "run", "/usr/bin/st -g 48x10 -e sh -c '/home/ayoub/Scripts/color-scripts/dotx | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/dotx" },
}
colorwheel = {
    { "run", "/usr/bin/st -g 20x7 -e sh -c '/home/ayoub/Scripts/color-scripts/colorwheel | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/colorwheel" },
}
crunch = {
    { "run", "/usr/bin/st -g 73x10 -e sh -c '/home/ayoub/Scripts/color-scripts/crunch | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/crunch" },
}
alpha = {
    { "run", "/usr/bin/st -g 60x7 -e sh -c '/home/ayoub/Scripts/color-scripts/alpha | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/alpha" },
}
colorview = {
    { "run", "/usr/bin/st -g 85x30 -e sh -c '/home/ayoub/Scripts/color-scripts/colorview | cat - /dev/tty'" },
    { "edit", "/usr/bin/st -g 150x50 -e vim /home/ayoub/Scripts/color-scripts/colorview" },
}
colorscriptss = {
    { "ghosts", ghostss },
    { "arch", Arch },
    { "DNA", DNA },
    { "PacMan", PacMan },
    { "pipes", Pipes },
    { "rally", Rally },
    { "TheBat", TheBat },
    { "illumina", illumina },
    { "spectrum", spectrum },
    { "dotx", dotx },
    { "colorwheel", colorwheel },
    { "crunch", crunch },
    { "alpha", alpha },
    { "colorview", colorview },    
			}
scriptss = {
	{ "Clrs", colorscriptss },
	{ "pfetch", "/usr/bin/st -g 40x10 -e sh -c '/home/ayoub/Scripts/pfetch | cat - /dev/tty'" },
	{ "bonsai", "/usr/bin/st -g 150x50 -e /home/ayoub/Scripts/bonsai/bonsai.sh -l -b 2" },
	}
virtualbox = {
	{ "Gentoo", "vboxmanage startvm Gentoo LIVE" },
	{ "Slackware", "vboxmanage startvm Slackware" },
	{ "Debian", "vboxmanage startvm Debian" },
	}
mymainmenu = awful.menu({ items = { { "Terminal", terminal },
                                    { "emacs", "emacs" },
                                    { " " },
                                    { "Ginny", "geany" },
                                    { "Firefox", "firefox" },
                                    { "ranger", "/usr/bin/st -g 150x50 -e /usr/bin/ranger" },
                                    { " " },
                                    { "Dev", dev},
                                    { "Graphics", graphics},
                                    { "Network", network},
                                    { "Shells", shells},
                                    { "VirtualBox", virtualbox},
                                    { "System", system},
                                    { "Science", science},
                                    { " " },
                                    { "Pipes", "/usr/bin/st -g 125x42 /home/ayoub/Scripts/color-scripts/pipes2" },
                                    { "htop", "/usr/bin/st -g 125x42 -e htop" },
                                    { "hello!", function () naughty.notify({ title = "Hello Ayoub!", text = "Have a nice day.", timeout = 5 }) end },
                                    { " " },
                                    { "Scripts", scriptss},
                                    { "Scrot", scrot},
                                    { "Amixer", volume},
                                    { "Conf", conf},
                                    { " " },
                                    { "awesome", myawesomemenu},
                                    { " " },
                                    { "Lock", "slock" },
                                    { "Exit", oexit },

                                }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
--- mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock("%I:%M", 60)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    -- gears.wallpaper.tiled("/home/ayoub/Pictures/tartanmaker.jpg", s)
    -- gears.wallpaper.centered("/home/ayoub/Pictures/wallpapers/Surviving Mars.png", s)
    -- gears.wallpaper.fit("/home/ayoub/Pictures/wallpapers/Surviving Mars.png", s)
    gears.wallpaper.maximized("/home/ayoub/Pictures/Backgrounds/xMzxbFU.jpg", s)
    -- Each screen has its own tag table.
    --- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    
    awful.tag.add("00", {
        -- icon               = "/home/ayoub/.icons/Flat-Remix-Dark/apps/scalable/Terminal.svg",
        layout             = awful.layout.suit.floating,
        --        master_fill_policy = "master_width_factor",
        gap_single_client  = true,
        gap                = 50,
        screen             = s,
        selected           = true,
        }
    )
    awful.tag.add("01", {
        --  icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
        layout = awful.layout.suit.max,
        gap                = 5,
        gap_single_client  = true,
        screen = s,
        }
    )
    awful.tag.add("02", {
        -- icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
        layout = awful.layout.suit.tile,
        gap = 5,
        gap_single_client = true,
        screen = s,
        }
    )
    awful.tag.add("10", {
        -- icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
        layout = awful.layout.suit.tile,
        gap = 5,
        screen = s,
        }
    )
     awful.tag.add("11", {
        -- icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
        layout = awful.layout.suit.tile,
        gap = 5,
        screen = s,
        }
    )
    awful.tag.add("12", {
        -- icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
        layout = awful.layout.suit.tile,
        gap = 5,
        screen = s,
        }
    )
    awful.tag.add("20", {
        -- icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
        layout = awful.layout.suit.tile,
        gap = 5,
        screen = s,
        }
    )
                      
    awful.tag.add("21", {
       -- icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
       layout = awful.layout.suit.tile,
       gap = 5,
       screen = s,
       }
    )
    awful.tag.add("22", {
       -- icon = "/home/ayoub/.icons/Flat-Remix-Dark/emblems/symbolic/emblem-ok-symbolic.svg",
       layout = awful.layout.suit.tile,
       gap = 5,
       screen = s,
       }
    )
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

	-- Separators
	bar_separator = wibox.widget.textbox(" | ")
	barp_separator = wibox.widget.textbox(" |")
	space_separator = wibox.widget.textbox(" ")

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top",height = 18, opacity = 1, width = 1920, screen = s })
    -- Registring vicious widgets
    -- For example: vicious.register(widget, wtype, format, interval, warg)
    -- memory
    memwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.mem)
    vicious.register(memwidget, vicious.widgets.mem, "$2 MiB", 13)
    -- battery
    batwidget = wibox.widget.textbox()
    vicious.register(batwidget, vicious.widgets.bat, "$2% / $1", 61, "BAT0")
    -- cpu temperature
    tempwidget = wibox.widget.textbox()
    vicious.register(tempwidget, vicious.widgets.thermal, "$1 °C", 17, "thermal_zone1")
    -- battery temp
    battempwidget = wibox.widget.textbox()
    vicious.register(battempwidget, vicious.widgets.thermal, " @ $1 °C", 81, "thermal_zone0")
    -- Wifi
    wifiwidget = wibox.widget.textbox()
    vicious.register(wifiwidget, vicious.widgets.wifiiw, "${ssid}", 9000, "wlp2s0")
    -- net speed
    netwidget = wibox.widget.textbox()
    vicious.register(netwidget, vicious.widgets.net, " @ ${wlp2s0 down_kb} kB/s")
    -- load 1 min
    loadwidget = wibox.widget.textbox()
    vicious.register(loadwidget, vicious.widgets.uptime, "$4, $5, $6")
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            --- space_separator,
            s.mytaglist,
            s.mypromptbox,
        },
            s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --- mykeyboardlayout,
            wibox.widget.systray(),
            wifiwidget,
            netwidget,
            bar_separator,
            loadwidget,
            bar_separator,
            tempwidget,
            bar_separator,
            batwidget,
            battempwidget,
            bar_separator,
            brightness_widget(),
            bar_separator,
            memwidget,
            bar_separator,
            volumebar_widget,
            bar_separator,
            mytextclock,
            barp_separator,
            s.mylayoutbox,
            --- space_separator,
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    -- Show/Hide Wibox
     awful.key({ modkey }, "b", function ()
             for s in screen do
                 s.mywibox.visible = not s.mywibox.visible
                 if s.mybottomwibox then
                     s.mybottomwibox.visible = not s.mybottomwibox.visible
                 end
            end
         end,
         {description = "toggle wibox", group = "awesome" }),
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome" }),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag" }),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag" }),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag" }),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client" }
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client" }
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome" }),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client" }),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client" }),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome" }),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout" }),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout" }),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout" }),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client" }),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher" }),
    awful.key({ }, "XF86Search",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher" }),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome" }),
    -- Sound and brightness
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer set Master 5%+") end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer set Master 5%-") end),
    awful.key({ }, "XF86AudioMute",  function () awful.util.spawn("amixer set Master toggle") end ),
    --- awful.key({ }, "XF86MonBrightnessDown",  function () awful.util.spawn("sudo xbacklight -dec 5") end ),
    --- awful.key({ }, "XF86MonBrightnessUp",  function () awful.util.spawn("sudo xbacklight -inc 5") end ),
    --- awful.key({ }, "XF86Sleep",  function () awful.util.spawn("xset dpms force off") end ),
    -- firefox, emacs...
    awful.key({ modkey ,"Shift" }, "f",     function ()  awful.util.spawn("firefox") end,
                {description = "start firefox", group = "launcher" }),
    awful.key({ modkey ,"Shift" }, "e",     function ()  awful.util.spawn("emacs") end,
                {description = "start emacs", group = "launcher" }),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher" })
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client" }),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client" }),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client" }),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client" }),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    { rule = { class = "st" },
       properties =  { floating = true },
       callback = function (c)
       awful.placement.centered(c,nil)
       end
    },
    { rule = { class = "Firefox" },
       callback = function (c)
       c.border_width = "0"
       awful.titlebar.hide(c)
       end
    },
    --{ rule = { class = "conky" },
        --properties = { tag = "00", maximized_vertical = true, maximized_horizontal = true }
      --  properties = { tag = "00", fullscreen = true },
        --  callback = function(c)
         -- c.border_width = "0"
        --  end
   -- },
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer" },

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, { height    = 10 }) : setup {
        { -- Left
            ---awful.titlebar.widget.iconwidget(c),
            awful.titlebar.widget.floatingbutton(c),
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            ---{ -- Title
            ---    align  = "center",
            ---    widget = awful.titlebar.widget.titlewidget(c)
            ---},
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            ---awful.titlebar.widget.floatingbutton (c),
            ---awful.titlebar.widget.maximizedbutton(c),
            ---awful.titlebar.widget.stickybutton   (c),
            ---awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

require("/etc/hyprland/catppuccin.lua")

-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        numlock_by_default = true,
        accel_profile = "flat",
    }
})

-- Monitor settings
require("/etc/hyprland/monitors.lua")
hl.env("WAYLANDDRV_PRIMARY_MONITOR", defaultMonitor) -- Wine Wayland
hl.exec_cmd("xrandr --output " .. defaultMonitor .. " --primary") -- XWayland
hl.config({
    cursor = {
        default_monitor = defaultMonitor, -- Cursor after login
    }
})

-- This rules only apply when using xdg-shell https://wiki.archlinux.org/title/SDDM#Wayland
hl.window_rule({
    match = { class = "^(sddm-greeter)$" },
    workspace = "emptym",
    fullscreen = true,
    stay_focused = true,
    decorate = false,
    no_anim = true,
    border_size = 0,
    no_dim = true,
    rounding = 0,
    no_shadow = true,
})

-- Disable default wallpaper which would otherwise be shown after logging in and before hyprpaper starts
-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
hl.config({
    misc = {
        disable_hyprland_logo = true,
    }
})

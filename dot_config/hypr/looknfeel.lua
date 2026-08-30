cursorSize = 24
cursorTheme = "capitaine-cursors"

-- Wayland cursors
hl.env("HYPRCURSOR_THEME", cursorTheme)
hl.env("HYPRCURSOR_SIZE", tostring(cursorSize))
-- XWayland cursors
hl.env("XCURSOR_THEME", cursorTheme)
hl.env("XCURSOR_SIZE", tostring(cursorSize))
-- QT Theme
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
-- GTK theme. Some GTK4 applications don't get themed without this? (e.g. envision)
hl.env("GTK_THEME", "Colloid-Purple-Dark-Compact-Catppuccin")

hl.config({
    general = {
        gaps_in = 1.5,
        gaps_out = 2,
        col = {
            active_border = mauve,
            inactive_border = surface0,
            nogroup_border_active = flamingo,
            nogroup_border = surface0,
        },
    }
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
    decoration = {
        rounding = 10,
        shadow = {
            enabled = false,
        }
    }
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
hl.config({
    animations = {
        enabled = false,
    }
})

-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true,
    }
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        render_unfocused_fps = 30,
    }
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#xwayland
hl.config({
    xwayland = {
        use_nearest_neighbor = false, -- Blur instead of pixelate
    }
})

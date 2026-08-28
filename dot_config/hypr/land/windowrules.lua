-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Floating
hl.window_rule({ match = { class = "^(engrampa)$" }, float = true })
hl.window_rule({ match = { title = "^(Welcome to JetBrains Rider)$" }, float = true })
hl.window_rule({ match = { title = "^(Welcome to IntelliJ IDEA)$" }, float = true })
hl.window_rule({ match = { class = "^(pavucontrol-qt)$" }, float = true })
hl.window_rule({ match = { title = "^(Starting Unity...)$" }, float = true })
hl.window_rule({ match = { class = "^(unityhub)$" }, float = true })

-- Transparent
local opacity = 0.95
hl.window_rule({ match = { class = "^(Alacritty)$" }, opacity = opacity })
hl.window_rule({ match = { class = "^(com.mitchellh.ghostty)$" }, opacity = opacity })
hl.window_rule({ match = { class = "^(jetbrains-idea)$" }, opacity = opacity })
hl.window_rule({ match = { class = "^(jetbrains-rider)$" }, opacity = opacity })

-- Logout screen background blur
hl.layer_rule({ match = { namespace = "^(logout_dialog)$" }, blur = true })

-- Global rules
hl.window_rule({
    name = "Global Rules",
    match = { class = "^(.*)$" },
    -- persistent_size = true, -- Always remember the size of floating windows
    render_unfocused = true, -- Fix games freezing / not responding when on an unfocused workspace
})

hl.config({
    misc = {
        render_unfocused_fps = 60, -- Allow unfocused games to run up to 60fps
    }
})

-- Brave/Firefox picture-in-picture
hl.window_rule({
    name = "PiP",
    match = { title = "^(Picture(\\s|-)in(\\s|-)[Pp]icture)$" },
    pin = true,
    float = true,
    keep_aspect_ratio = true,
})

-- File save dialogs
hl.window_rule({
    name = "Save Dialogs",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    no_initial_focus = true, -- Prevent accidentally overwriting the saved file name if typing when it appears
    no_close_for = 500, -- Prevent accidentally closing the popup as soon as it opens. Only applies to SUPER+Q
})

-- Nextcloud
hl.window_rule({
    name = "Nextcloud",
    match = { class = "^(com.nextcloud.desktopclient.nextcloud)$" },
    float = true,
    move = "(cursor_x-(window_w*0.5)) cursor_y",
})

-- Unity 2019 compiling/importing popups
hl.window_rule({
    name = "Unity 2019 Popups",
    match = { class = "^(Unity)$", title = "^(Importing)$", float = true },
    no_initial_focus = true,
    move = "((monitor_w*0.5)-(window_w*0.5)) (monitor_h*0.07)",
})

-- Unity 6 popups (object reference search)
hl.window_rule({
    name = "Unity 6 Popups",
    match = { class = "^(Unityhub-unity-editor.*)$", title = "^(Select.*)$", float = true },
    no_initial_focus = true,
})

-- Unity 6 importing/compiling progress bar and context menus
hl.window_rule({
    name = "Unity 6 Importing and Compiling Popup",
    match = { class = "^(Unityhub-unity-editor.*)$", title = "^(unityhub-unity-editor.*)$", float = true },
    no_initial_focus = true,
    -- move = "((monitor_w*0.5)-(window_w*0.5)) (monitor_h*0.07)" -- Breaks context menus :(
})

-- Unity 6 floating windows (asset selectors, package manager, etc)
hl.window_rule({
    name = "Unity 6 Floating Windows",
    match = { class = "^(Unity)$", title = "negative:^(Unity)$", float = true },
    move = "(cursor_x-(window_w)) cursor_y",
})

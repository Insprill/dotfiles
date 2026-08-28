hl.window_rule({ match = { title = "^(Starting Unity...)$" }, float = true })
hl.window_rule({ match = { class = "^(unityhub)$" }, float = true })

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

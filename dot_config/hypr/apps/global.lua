-- Global rules
hl.window_rule({
    name = "Global Rules",
    match = { class = "^(.*)$" },
    persistent_size = true, -- Always remember the size of floating windows
    render_unfocused = true, -- Fix games freezing / not responding when on an unfocused workspace
})

hl.config({
    misc = {
        render_unfocused_fps = 60, -- Allow unfocused games to run up to 60fps
    }
})

-- Brave/Firefox picture-in-picture
hl.window_rule({
    name = "PiP",
    match = { title = "^(Picture(\\s|-)in(\\s|-)[Pp]icture)$" },
    pin = true,
    float = true,
    keep_aspect_ratio = true,
})

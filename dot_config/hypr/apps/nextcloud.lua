-- Nextcloud
hl.window_rule({
    name = "Nextcloud",
    match = { class = "^(com.nextcloud.desktopclient.nextcloud)$" },
    float = true,
    move = "(cursor_x-(window_w*0.5)) cursor_y",
})

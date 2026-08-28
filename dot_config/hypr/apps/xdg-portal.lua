-- File save dialogs
hl.window_rule({
    name = "Save Dialogs",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    no_initial_focus = true, -- Prevent accidentally overwriting the saved file name if typing when it appears
    no_close_for = 500, -- Prevent accidentally closing the popup as soon as it opens. Only applies to SUPER+Q
})

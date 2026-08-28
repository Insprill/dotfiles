hl.window_rule({
	name = "Ente Auth Fullscreen Fix",
	match = { class = "^(io.ente.auth)$" },
	suppress_event = "maximize",
	no_screen_share = true,
	float = true,
})

hl.window_rule({
	match = {
		class = "^(jetbrains-.*)$",
		title = "^(Welcome to .*)$",
	},
	float = true,
})
hl.window_rule({ match = { class = "^(jetbrains-.*)$" }, opacity = 0.95 })

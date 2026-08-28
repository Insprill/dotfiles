hl.window_rule({ match = { title = "^(Welcome to JetBrains Rider)$" }, float = true })
hl.window_rule({ match = { title = "^(Welcome to IntelliJ IDEA)$" }, float = true })
hl.window_rule({ match = { class = "^(jetbrains-idea)$" }, opacity = 0.95 })
hl.window_rule({ match = { class = "^(jetbrains-rider)$" }, opacity = 0.95 })
-- Disable mouse focus (see https://github.com/basecamp/omarchy/pull/5183#issuecomment-4189299971).
hl.window_rule({ match = { class = "^(jetbrains-.*)$" }, no_follow_mouse = true })

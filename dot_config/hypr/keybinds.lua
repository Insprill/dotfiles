-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers/#dispatchers-1

-- Applications
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(os.getenv("TERMINAL")))
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + B", hl.dsp.exec_cmd(os.getenv("BROWSER")))
hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort -calc-command \"wl-copy '{result}'\""))
hl.bind("SUPER + PERIOD", hl.dsp.exec_cmd("rofi -show emoji -modi emoji -matching normal -emoji-mode copy"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("Print", hl.dsp.exec_cmd("omasnap"))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tesseract - - -l eng | wl-copy"))
hl.bind("SUPER + ALT + SHIFT + T", hl.dsp.exec_cmd("kitty"))

-- General
hl.bind("SUPER + SPACE", hl.dsp.window.float())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + T", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("~/bin/set-wallpaper.sh"))
hl.bind("SUPER + ALT + SHIFT + R", hl.dsp.exec_cmd("killall waybar; waybar; killall swayosd-server; swayosd-server; killall swaync; swaync"))
hl.bind("SUPER + ALT + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- Media controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { release = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))
hl.bind("CONTROL + ALT + SHIFT + Minus", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { repeating = true })

-- Move focus with SUPER + h/j/k/l
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

-- Move windows with SUPER + SHIFT + h/j/k/l
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Workspace switching and window moving via the split-monitor-workspaces plugin
local smw = require("plugins.split-monitor-workspaces")
for i = 1, smw.get_amount_of_workspaces() do
	local n = tostring(i)
	if n == "10" then n = "0" end
	-- Switch workspaces with SUPER + [0-9]
	hl.bind("SUPER + " .. n, smw.workspace(n))
	-- Move active window to a workspace with SUPER + ALT + [0-9]
	hl.bind("SUPER + ALT + " .. n, smw.move_to_workspace(n))
	-- Move active window to a workspace with SUPER + SHIFT + [0-9]
	hl.bind("SUPER + SHIFT + " .. n, smw.move_to_workspace_silent(n))
end

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

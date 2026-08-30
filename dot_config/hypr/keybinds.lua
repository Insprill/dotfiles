-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers/#dispatchers-1

local nipc = "noctalia msg "

-- Applications
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(os.getenv("TERMINAL")), { description = "Open Terminal" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"), { description = "Open File Explorer" })
hl.bind("SUPER + B", hl.dsp.exec_cmd(os.getenv("BROWSER")), { description = "Open Browser" })
hl.bind("SUPER + D", hl.dsp.exec_cmd(nipc .. "panel-toggle launcher"), { description = "Open Launcher" })
hl.bind("SUPER + C", hl.dsp.exec_cmd(nipc .. "panel-toggle launcher /calc"), { description = "Open Launcher in Calculator Mode" })
hl.bind("SUPER + PERIOD", hl.dsp.exec_cmd(nipc .. "panel-toggle launcher /emo"), { description = "Open Launcher in Emoji Picking Mode" })
hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Color Picker" })
hl.bind("Print", hl.dsp.exec_cmd("omasnap"), { description = "Take Screenshot" })
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tesseract - - -l eng | wl-copy"), { description = "Select a region to OCR" })
hl.bind("SUPER + ALT + SHIFT + T", hl.dsp.exec_cmd("kitty"), { description = "Open Backup Terminal" })

-- General
hl.bind("SUPER + SPACE", hl.dsp.window.float(), { description = "Toggle Float" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen(), { description = "Toggle Fullscreen" })
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close Window" })
hl.bind("SUPER + T", hl.dsp.layout("togglesplit"), { description = "Toggle Vertical/Horizontal split" })
hl.bind("SUPER + M", hl.dsp.exit(), { description = "Logout" })
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(nipc .. "wallpaper-random"), { description = "Randomly select a new wallpaper" })
hl.bind("SUPER + ALT + SHIFT + L", hl.dsp.exec_cmd("hyprlock"), { description = "Lock" })

-- Media controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Skip to the Previous Track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Skip to the Next Track" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/Pause the Currently Playing Media" })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { release = true, description = "Stop the Currently Plaing Media" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(nipc .. "volume-mute"), { description = "Toggle Volume Mute" })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(nipc .. "volume-up"), { repeating = true, description = "Decrease Volume by 5%" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(nipc .. "volume-down"), { repeating = true, description = "Increase Volume by 5%" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(nipc .. "mic-mute"), { description = "Toggle Mic Mute" })
hl.bind("CONTROL + ALT + SHIFT + Minus", hl.dsp.exec_cmd(nipc .. "mic-mute"), { description = "Toggle Mic Mute" })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(nipc .. "brightness-up"), { repeating = true, description = "Increase Brightness by 5%" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(nipc .. "brightness-down"), { repeating = true, description = "Decrease Brightness by 5%" })

-- Move focus with SUPER + h/j/k/l
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }), { description = "Move Focus Left" })
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }), { description = "Move Focus Up" })
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }), { description = "Move Focus Down" })
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }), { description = "Move Focus Right" })

-- Move windows with SUPER + SHIFT + h/j/k/l
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }), { description = "Move Window Left" })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }), { description = "Move Window Up" })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }), { description = "Move Window Down" })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }), { description = "Move Window Right" })

-- Workspace switching and window moving via the split-monitor-workspaces plugin
local smw = require("plugins.split-monitor-workspaces")
for i = 1, smw.get_amount_of_workspaces() do
	local n = tostring(i)
	if n == "10" then n = "0" end
	-- Switch workspaces with SUPER + [0-9]
	hl.bind("SUPER + " .. n, smw.workspace(n), { description = "Switch to Workspace " .. n })
	-- Move active window to a workspace with SUPER + ALT + [0-9]
	hl.bind("SUPER + ALT + " .. n, smw.move_to_workspace(n), { description = "Move Window and Focus to Workspace " .. n })
	-- Move active window to a workspace with SUPER + SHIFT + [0-9]
	hl.bind("SUPER + SHIFT + " .. n, smw.move_to_workspace_silent(n), { description = "Move Window to Workspace " .. n })
end

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move Window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize Window" })

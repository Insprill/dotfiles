require("catppuccin")

-- Monitor settings
require("monitors")
hl.env("DXVK_HDR", "1")
hl.env("ENABLE_HDR_WSI", "1")
hl.env("WAYLANDDRV_PRIMARY_MONITOR", defaultMonitor) -- Wine Wayland
hl.exec_cmd("xrandr --output " .. defaultMonitor .. " --primary") -- XWayland
hl.config({
	cursor = {
		default_monitor = defaultMonitor, -- Cursor after login
	},
})

require("autostart")
require("./apps/*")
require("env")
require("input")
require("keybinds")
require("looknfeel")
require("plugins")
require("wayland")
require("nvidia") -- Only applied if actually Nvidia
require("ime")

require("catppuccin")

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

-- Monitor settings
require("monitors")
hl.env("DXVK_HDR", "1")
hl.env("ENABLE_HDR_WSI", "1")
hl.env("WAYLANDDRV_PRIMARY_MONITOR", hl.get_config("cursor.default_monitor")) -- Wine Wayland
hl.exec_cmd("xrandr --output " .. hl.get_config("cursor.default_monitor") .. " --primary") -- XWayland

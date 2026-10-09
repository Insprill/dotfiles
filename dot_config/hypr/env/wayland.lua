-- Force/hint Wayland support
hl.env("QT_QPA_PLATFORM", "wayland") -- QT
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto") -- Electron
hl.env("PROTON_ENABLE_WAYLAND", "1") -- Proton
hl.env("SDL_VIDEODRIVER", "wayland") -- BeamNG
hl.env("SDL_VIDEO_DRIVER", "wayland") -- CS2
hl.env("SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY", "1") -- Make SDL games use the correct resolution with fractional scaling
hl.env("STEAM_FORCE_DESKTOPUI_SCALING", "1") -- Fix Steam scaling

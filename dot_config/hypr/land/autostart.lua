hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("swaync")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("sleep 0.5; ~/bin/set-wallpaper.sh") -- This CANNOT be on the same line as hyprpaper!

    -- Other applications
    hl.exec_cmd("dex -a")
end)

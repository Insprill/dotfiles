hl.on("hyprland.start", function()
	-- Slow app launch fix -- set systemd vars before starting session services.
	hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")

	hl.exec_cmd("noctalia")
	hl.exec_cmd("sleep 0.5 && noctalia msg wallpaper-random")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("dex -a")
end)

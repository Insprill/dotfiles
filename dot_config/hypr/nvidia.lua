-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/#nvidia-specific

require("util")

-- https://github.com/basecamp/omarchy/blob/06e32d243d5c410e2421b9f3db5be3c3ae33d3e2/default/hypr/nvidia.lua#L3-L19
local nvidia = os.getenv("HOME") .. "/bin/omarchy-hw-nvidia"
local nvidia_gsp = os.getenv("HOME") .. "/bin/omarchy-hw-nvidia-gsp"
local nvidia_without_gsp = os.getenv("HOME") .. "/bin/omarchy-hw-nvidia-without-gsp"

-- These detectors read cached sysfs IDs rather than shelling out to lspci.
-- lspci reads PCI config space, which resumes a runtime-suspended GPU, and on a
-- hybrid laptop that wake alone outlasts Hyprland's 1.5s config reload budget.
if util.shell_succeeds(nvidia) then
	if util.shell_succeeds(nvidia_gsp) then
		hl.env("NVD_BACKEND", "direct")
		hl.env("LIBVA_DRIVER_NAME", "nvidia")
		hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
	elseif util.shell_succeeds(nvidia_without_gsp) then
		hl.env("NVD_BACKEND", "egl")
		hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
	end
end


-- Proton-GE / Proton-CachyOS Features

-- Allow Proton games to properly interact with Discord
hl.env("PROTON_DISCORD_BRIDGE", "1")

-- Enable FSR 3.1 -> FSR 4 upgrade.
hl.env("PROTON_FSR4_UPGRADE", "1")

-- Better impl of VK_AMD_anti_lag and VK_NV_low_latency2
-- https://github.com/Korthos-Software/low_latency_layer
hl.env("LOW_LATENCY_LAYER", "1")
hl.env("LOW_LATENCY_LAYER_REFLEX", "1")

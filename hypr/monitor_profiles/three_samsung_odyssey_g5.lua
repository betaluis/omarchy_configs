-- Reference profile: three Samsung Odyssey G5 monitors (2560x1440, 60 Hz).
-- Physical layout, left to right: HDMI-A-1, DP-1, DP-2.
--
-- This profile is intentionally not loaded by hypr/hyprland.lua. To use it,
-- copy these rules into hypr/monitors.lua (replacing its generic monitor rule),
-- then confirm connector names with `hyprctl monitors all`.

local monitor_scale = 1

hl.env("GDK_SCALE", "1")
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = monitor_scale })
hl.monitor({ output = "DP-1", mode = "preferred", position = "2560x0", scale = monitor_scale })
hl.monitor({ output = "DP-2", mode = "preferred", position = "5120x0", scale = monitor_scale })

-- Keep workspaces 1–5 on the left monitor and 6–10 on the center monitor.
-- The right monitor remains available for ad-hoc workspaces.
for workspace = 1, 5 do
  hl.workspace_rule({ workspace = tostring(workspace), monitor = "HDMI-A-1" })
end

for workspace = 6, 10 do
  hl.workspace_rule({ workspace = tostring(workspace), monitor = "DP-1" })
end

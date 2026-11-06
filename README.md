# omarchy_configs

## Monitor profiles

`hypr/monitors.lua` remains the portable, generic monitor configuration. The
three-monitor Samsung Odyssey G5 reference layout is in
`hypr/monitor_profiles/three_samsung_odyssey_g5.lua`:

- `HDMI-A-1` at `0x0`
- `DP-1` at `2560x0`
- `DP-2` at `5120x0`
- 2560×1440 at scale `1`, with workspaces 1–5 on HDMI and 6–10 on DP-1

The profile is not loaded automatically. When applying it to a machine, first
verify output names with `hyprctl monitors all`, then copy its rules into
`hypr/monitors.lua`. Reload Hyprland and check `hyprctl configerrors`.

## Post Install Setup
- Connect to wifi
- Update system
- Connect to github cli
- Copy XKB symbols (/usr/share/X11/xkb/symbols/)
- Copy hyprland configs
- Copy nvim setup

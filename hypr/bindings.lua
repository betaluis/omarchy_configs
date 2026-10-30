-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.
-- AGENT SYNC: Whenever you change this file, make the same change in the
-- active Hyprland config at ~/.config/hypr/bindings.lua, then commit and push
-- this personal config repository.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Migrated personal bindings from bindings.conf.bak.20260806183923.
-- These defaults were intentionally replaced: arrows, SUPER+C/V, SUPER+J/K/L/P/O,
-- SUPER+SHIFT+N, and SUPER+SHIFT+W.
hl.unbind("SUPER + LEFT")
hl.unbind("SUPER + RIGHT")
hl.unbind("SUPER + UP")
hl.unbind("SUPER + DOWN")
hl.unbind("SUPER + C")
hl.unbind("SUPER + V")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
hl.unbind("SUPER + P")
hl.unbind("SUPER + O")
hl.unbind("SUPER + SHIFT + N")
hl.unbind("SUPER + SHIFT + W")

-- Use Typora instead of the default Omawrite binding.
o.bind("SUPER + SHIFT + W", "Typora", o.launch("typora --enable-wayland-ime"))

-- Vim-style focus navigation.
o.bind("SUPER + H", "Move focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Move focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Move focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Move focus down", hl.dsp.focus({ direction = "d" }))

-- Move the active tiled window in a direction.
o.bind("SUPER + SHIFT + H", "Move window left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + L", "Move window right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + SHIFT + K", "Move window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + J", "Move window down", hl.dsp.window.swap({ direction = "d" }))

-- Screenshot directly to the clipboard, and put the old split toggle on SUPER+V.
o.bind("SUPER + SHIFT + N", "Screenshot to clipboard", "omarchy-capture-screenshot smart copy")
o.bind("SUPER + V", "Toggle window split", hl.dsp.layout("togglesplit"))

-- Open Attio directly in Zen Browser.
o.bind("SUPER + SHIFT + I", "Attio", o.launch("zen-browser --new-window https://app.attio.com"))

-- Replace the notification action and disable the preinstalled HEY Mail shortcuts.
-- SUPER+E was "Invoke last notification"; reserve it for Voxtype instead.
hl.unbind("SUPER + E")
hl.unbind("SUPER + SHIFT + E")
hl.unbind("SUPER + SHIFT + ALT + E")
o.bind("SUPER + E", "Toggle Voxtype voice-to-text", "voxtype record toggle")
o.bind("SUPER + SHIFT + E", "Invoke last notification", "omarchy-shell notifications invokeLast")

-- Toggle the active workspace between dwindle and scrolling layouts.
o.bind("SUPER + D", "Toggle workspace dwindle/scrolling layout", "omarchy-hyprland-workspace-layout-toggle")

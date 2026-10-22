# Setup

## Pi configuration backup

Copy the files in `pi/` to `~/.pi/agent/` after cloning:

```bash
cp pi/settings.json pi/keybindings.json pi/system.md ~/.pi/agent/
```

Restart Pi or run `/reload` after copying the files.

### Current Pi packages

- `npm:pi-web-access` — web research and retrieval tools.
- `npm:@rezamonangg/pi-code-preview` — code previews.
- `npm:pi-markdown-preview` — Markdown previews.

### Current Pi keybinding

- `ctrl+shift+q` — jump to the latest transcript message.

## Omarchy shell plugins

No user-installed Omarchy shell plugins are configured. The current bar uses built-in widgets, including menu, workspaces, clock, weather, system updates, tray, agents, Bluetooth, network, audio, monitor, and power.

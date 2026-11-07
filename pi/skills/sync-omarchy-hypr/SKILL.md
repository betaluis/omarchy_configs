---
name: sync-omarchy-hypr
description: >
  Synchronize the active Hyprland configuration from the user's
  ~/.config/omarchy_configs Git repository. Use whenever the user asks to pull,
  sync, apply, restore, or update Hyprland or ~/.config/hypr configuration from
  their omarchy_configs repository.
---

# Sync Hyprland Config from omarchy_configs

Use this workflow to make `~/.config/hypr/` match the tracked Hyprland config
in `~/.config/omarchy_configs/`.

## Source and Destination

- Repository: `~/.config/omarchy_configs`
- Expected tracked Hyprland directory: `~/.config/omarchy_configs/hypr/`
- Active configuration: `~/.config/hypr/`

If the repository or its `hypr/` directory does not exist, stop and report the
missing path. Do not guess another source directory.

## Required Workflow

1. Read the `omarchy` skill and its `hyprland.md` guide before changing the
   active configuration.
2. Confirm the repository is a Git worktree and inspect its state:

   ```bash
   git -C ~/.config/omarchy_configs status --short
   git -C ~/.config/omarchy_configs branch --show-current
   ```

   If it has local changes, stop and ask whether to preserve them, commit them,
   or discard them. Never overwrite repository changes implicitly.
3. Pull only fast-forward remote updates:

   ```bash
   git -C ~/.config/omarchy_configs pull --ff-only
   ```

   If the pull fails, stop and report the error; do not use merge, rebase, or
   force options without explicit user approval.
4. Compare the source and destination, including files that the sync would
   delete:

   ```bash
   diff -ruN ~/.config/hypr ~/.config/omarchy_configs/hypr || true
   ```

   Tell the user which files will be added, changed, and removed.
5. Before modifying `~/.config/hypr/`, create a timestamped backup outside the
   active config directory:

   ```bash
   backup="$HOME/.config/hypr.backup.$(date +%Y%m%d-%H%M%S)"
   cp -a ~/.config/hypr "$backup"
   ```
6. Make the destination exactly match the repository source, preserving no
   destination-only files:

   ```bash
   rsync -a --delete ~/.config/omarchy_configs/hypr/ ~/.config/hypr/
   ```

   Do not edit `/usr/share/omarchy/`.
7. Validate the synchronized Lua Hyprland configuration:

   ```bash
   hyprctl reload
   hyprctl configerrors
   ```

   Fix reported errors only when their cause is clear. If errors remain, report
   them and retain the backup path for rollback.
8. Call out separate-process files: restart `hyprsunset` with
   `omarchy restart hyprsunset` if `hyprsunset.conf` changed. Explain that
   `xdph.conf` takes effect after its portal restarts or at next login.

## Safety Rules

- Treat the repository as the source of truth only for this explicit sync.
- Never run `git reset --hard`, `git clean`, or a non-fast-forward pull unless
  the user explicitly asks.
- Never use `omarchy refresh hyprland` for this workflow: it would replace the
  repository's configuration with Omarchy defaults.
- Report the pulled commit and the backup location after completion.


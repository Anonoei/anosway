#!/usr/bin/env bash
ROOT="$HOME/.config/sway"
toolwait="bash $HOME/.config/sway/scripts.d/toolwait.sh"

swaymsg "workspace number 1"
$toolwait chromium
swaymsg "workspace number 5"
$toolwait code
swaymsg "workspace number 8"
$toolwait obsidian
swaymsg "workspace number 9"
$toolwait discord
$toolwait signal-desktop

swaymsg "workspace number 1"

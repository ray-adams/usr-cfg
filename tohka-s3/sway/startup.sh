#!/bin/sh

# Script Name: startup.sh
# Script Path: ${XDG_CONFIG_HOME}/sway/startup.sh
# Description: Startup script for sway.

# Copyright (c) 2024 Ray Adams
# SPDX-Licence-Identifier: BSD-3-Clause

# Version: 1.0.0

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway

killall pipewire

sleep 2

dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

dunst -c ~/.config/dunst/dunstrc &

gentoo-pipewire-launcher &

wallpaper &

waybar &

# Custom scripts
~/.config/sway/idlelock.sh &
~/.config/sway/portal-startup.sh &

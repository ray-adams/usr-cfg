#!/bin/sh

# Script Name: portal-startup.sh
# Script Path: ${XDG_CONFIG_HOME}/sway/portal-startup.sh
# Description: Start the desktop portal for Sway.

# Copyright (c) 2024 Ray Adams
# SPDX-Licence-Identifier: BSD-3-Clause

# Version: 1.0.0

sleep 1

killall xdg-desktop-portal-gtk
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal

/usr/libexec/xdg-desktop-portal-gtk &
/usr/libexec/xdg-desktop-portal-wlr &

sleep 2

/usr/lib/xdg-desktop-portal &

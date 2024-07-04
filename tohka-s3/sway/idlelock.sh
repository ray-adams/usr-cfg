#!/bin/sh

# Script Name: idlelock.sh
# Script Path: ${XDG_CONFIG_HOME}/sway/idlelock.sh
# Description: Swayidle script to lock screen.

# Copyright (c) 2024 Ray Adams
# SPDX-Licence-Identifier: BSD-3-Clause

# Version: 1.0.0

swayidle -w \
    timeout 1800 'swaylock -fi ~/media/wallpapers/static/gentoo.xpm'\
    before-sleep 'swaylock -fi ~/media/wallpapers/static/gentoo.xpm' &

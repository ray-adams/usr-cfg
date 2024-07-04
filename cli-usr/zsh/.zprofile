# File Name: .zprofile
# File Path: ${XDG_CONFIG_HOME}/zsh/.zprofile
# Description: ZSH profile configuration file.

# Copyright (c) 2024 Ray Adams
# SPDX-Licence-Identifier: BSD-3-Clause

# Version: 1.0.0

if [[ "$(tty)" = "/dev/tty1" ]]
then
    # This is for bemenu
    export PATH="${PATH}:$HOME/.local/bin:$XDG_DATA_HOME/cargo/bin:$XDG_DATA_HOME/flatpak/bin"

    eval "$(ssh-agent -s)"
    dbus-run-session sway
    logout
fi

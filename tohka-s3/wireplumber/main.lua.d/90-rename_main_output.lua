-- File Name: 90-rename_main_output.lua
-- File Path: ${XDG_CONFIG_HOME}/wireplumber/main.lua.d/90_rename_main_output.lua
-- Description: Rename the main output device.

-- Copyright (c) 2024 Ray Adams
-- SPDX-License-Identifier: BSD-3-Clause

-- Version: 1.0.0

rule = {
    matches = {
        {
            { "node.name", "equals", "alsa_output.usb-SYC_SA9123_USB_Audio-01.analog-stereo"},
        },
    },
    apply_properties = {
        ["node.description"] = "System",
        ["node.nick"] = "System"
    },
}
rule = {
    matches = {
        {
            { "device.name", "equals", "alsa_card.usb-SYC_SA9123_USB_Audio-01"},
        },
    },
    apply_properties = {
        ["device.description"] = "System",
        ["device.nick"] = "System"
    },
}

table.insert(alsa_monitor.rules,rule)

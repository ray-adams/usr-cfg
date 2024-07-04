-- File Name: 90-disable_webcam_mic.lua
-- File Path: ${XDG_CONFIG_HOME}/wireplumber/main.lua.d/90-disable_webcam_mic.lua
-- Description: Disable the webcam microphone.

-- Copyright (c) 2024 Ray Adams
-- SPDX-License-Identifier: BSD-3-Clause

-- Version: 1.0.0

rule = {
    matches = {
        {
            { "device.name", "equals", "alsa_card.usb-046d_Logi_4K_Stream_Edition_51C07EAF-03"},
        },
    },
    apply_properties = {
        ["device.disabled"] = true,
    },
}

table.insert(alsa_monitor.rules,rule)

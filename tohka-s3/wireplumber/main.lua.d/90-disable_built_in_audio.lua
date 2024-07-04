-- File Name: 90-disable_built_in_audio.lua
-- File Path: ${XDG_CONFIG_HOME}/wireplumber/main.lua.d/90-built_in_audio.lua
-- Description: Disable the built in audio card.

-- Copyright (c) 2024 Ray Adams
-- SPDX-License-Identifier: BSD-3-Clause

-- Version: 1.0.0

rule = {
    matches = {
        {
            { "device.name", "equals", "alsa_card.pci-0000_00_1f.3"},
        },
    },
    apply_properties = {
        ["device.disabled"] = true,
    },
}

table.insert(alsa_monitor.rules,rule)

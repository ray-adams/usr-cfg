-- File Name: visualizer.lua
-- File Path: ${XDG_CONFIG_HOME}/mpv/scripts/osc_on_seek.lua
-- Description: Script to make the on screen controller visible while seeking.

-- Copyright (c) 2024, Ray Adams
-- SPDX-Licence-Identifier: BSD-3-Clause

-- Version: 1.0.0

for key, loader in pairs(package.loaders) do
    res = loader('@osc.lua')
    print('res value', '"', res, '"', type(res))
    if type(res) == 'function' then
        print('found', res, res('@osc.lua'))
        break
    end
end

function seek_handler()
    show_osc()
end
mp.register_event("seek", seek_handler)

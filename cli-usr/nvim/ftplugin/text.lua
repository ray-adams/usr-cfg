-- File Name: text.lua
-- File Path: ${XDG_CONFIG_HOME}/nvim/ftplugin/text.lua
-- Description: Neovim configuration for *.txt files.

-- Copyright (c) 2024 Ray Adams
-- SPDX-License-Identifier: BSD-3-Clause

-- Version: 1.0.0

-- Basic Settings
vim.api.nvim_command('set spelllang=en_gb')

-- Status Line
vim.opt.statusline = [[%#LineNr# %t %= %{luaeval('WordCount()')} %= %l %L]]

-- Word Count Function
function WordCount()
    local count = vim.fn.wordcount().words
    return count
end

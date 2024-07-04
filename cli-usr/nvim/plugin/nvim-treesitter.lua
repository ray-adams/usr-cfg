-- File Name: nvim-treesitter.lua
-- File Path: ${XDG_CONFIG_HOME}/nvim/plugin/nvim-treesitter.lua
-- Description: Neovim treesitter plugin configuration file.

-- Copyright (c) 2024 Ray Adams
-- SPDX-License-Identifier: BSD-3-Clause

-- Version: 1.0.0

require'nvim-treesitter.configs'.setup {
     ensure_installed = { "lua" },  -- Ensure Lua parser is installed
     highlight = {
       enable = true,
     },
   }

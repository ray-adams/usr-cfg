-- File Name: tex.lua
-- File Path: ${XDG_CONFIG_HOME}/nvim/ftplugin/tex.lua
-- Description: Neovim configuration for *.tex files.

-- Copyright (c) 2024 Ray Adams
-- SPDX-License-Identifier: BSD-3-Clause

-- Version: 1.0.0

-- Basic Settings
vim.opt.textwidth = 0
vim.wo.colorcolumn = '120'
vim.wo.wrap = false

-- Keybinds
vim.api.nvim_set_keymap('n', '<C-w>', ':VimtexCountWords <CR>', { noremap = true, silent = true})

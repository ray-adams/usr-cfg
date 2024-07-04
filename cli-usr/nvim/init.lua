-- File Name: init.lua
-- File Path: ${XDG_CONFIG_HOME}/nvim/init.lua
-- Description: Main neovim configuration file.

-- Copyright (c) 2024 Ray Adams
-- SPDX-License-Identifier: BSD-3-Clause

-- Version: 1.0.0

-- Basic Settings
vim.wo.number = true
vim.opt.textwidth = 80
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.opt.clipboard:append('unnamedplus')

-- Keybinds
vim.api.nvim_set_keymap('n', 'J', '5j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '5k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('x', 'J', '5j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'K', '5k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ', ', ':nohlsearch <CR>', { noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('n', '<C-h>', ':set spell!<CR>', { noremap = true, silent = true})

-- Status Line
vim.opt.title = true
vim.opt.titlestring = "%F"
vim.opt.laststatus = 2
vim.opt.statusline = [[%#LineNr# %t %= %l %L]]

-- Colorscheme
vim.cmd('colorscheme aurora')

-- Templates
 vim.cmd([[
   augroup Templates
     autocmd!
     autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/template.tex
   augroup END
 ]])

---- Transparency
vim.cmd('hi! Normal ctermbg=none guibg=none')
vim.cmd('hi! EndOfBuffer ctermbg=none guibg=none')
vim.cmd('hi! LineNr ctermbg=none guifg=#ffcccb guibg=none')
vim.cmd('hi! NormalNC ctermbg=none guibg=none')

-- Vimplug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug('lervag/vimtex')
    Plug('habamax/vim-asciidoctor')
    Plug('nvim-treesitter/nvim-treesitter')
vim.call('plug#end')

vim.api.nvim_command('autocmd User PluginUpdatePost * silent! TSUpdate')

---- Vimtex options
vim.g.tex_conceal = ''

---- VViki setup
vim.g.vviki_root = '~/notes'
vim.g.vviki_ext = '.adoc'
vim.api.nvim_set_keymap('n', '<leader>ww', ':e ~/notes/index.adoc<CR>', { noremap = true, silent = true})

---- vim-asciidoctor options.
vim.g.asciidoctor_fenced_languages = { 'python', 'c', 'rust', 'cpp', 'bash', 'html', 'css' }

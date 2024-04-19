require "nvchad.options"

local o = vim.o
local g = vim.g

-- General Options
o.cursorlineopt = "both"
o.relativenumber = true

-- Auto-reload
vim.cmd [[
  autocmd FocusGained,BufEnter * checktime
]]

-- Neovide
o.guifont = "MesloLGS Nerd Font"
g.neovide_scale_factor = 0.8
g.neovide_cursor_animation_length = 0.05
g.neovide_cursor_train_size = 0.5

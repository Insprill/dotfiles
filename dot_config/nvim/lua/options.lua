require "nvchad.options"

local o = vim.o
local g = vim.g

-- General Options
o.cursorlineopt = "both"
o.relativenumber = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.winborder = "rounded"

-- Windows-specific options
if jit.os == "Windows" then
  o.shell = "pwsh"
end

-- Auto-reload
vim.cmd [[
  autocmd FocusGained,BufEnter * checktime
]]

-- Neovide
o.guifont = "MesloLGS Nerd Font"
g.neovide_scale_factor = 0.8
g.neovide_cursor_animation_length = 0.05
g.neovide_cursor_train_size = 0.5

-- Autocmds
require "autocmds"

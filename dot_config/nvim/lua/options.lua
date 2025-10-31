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
o.guifont = "JetBrainsMono Nerd Font:h10"
g.neovide_opacity = 0.95
g.neovide_cursor_animation_length = 0.01

-- Suda
g.suda_smart_edit = 1

-- Autocmds
require "autocmds"

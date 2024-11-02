require "nvchad.options"

local o = vim.o
local g = vim.g

-- General Options
o.cursorlineopt = "both"
o.relativenumber = true

-- Windows-specific options
if jit.os == "Windows" then
  o.shell = "pwsh"
  -- This is super hacky, but necessary for nvim-treesitter to work
  -- properly on Windows. Using CC or GCC will cause Neovim to crash
  -- as soon as a treesitter is loaded. Using zig causes nothing to
  -- compile at all. Setting "require 'nvim-treesitter.install'.compilers"
  -- to "zig" in the plugins' init function works, but not for the first
  -- install, since the compilation process starts before init is called.
  -- This ends up being the only way to get everything fully functional
  -- the first time nvim-treesitter is installed.
  vim.fn.setenv("CC", "clang")
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

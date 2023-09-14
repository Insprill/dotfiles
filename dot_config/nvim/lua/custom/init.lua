local opt = vim.opt

-- Debugging
-- vim.lsp.set_log_level("debug")

-- Numbers
opt.relativenumber = true

-- Auto-reload
vim.cmd([[
  autocmd FocusGained,BufEnter * checktime
]])

-- Neovide
vim.o.guifont = "MesloLGS Nerd Font"
vim.g.neovide_scale_factor = 0.8
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0.5

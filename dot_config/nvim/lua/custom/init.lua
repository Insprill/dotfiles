local opt = vim.opt

-- Debugging
-- vim.lsp.set_log_level("debug")

-- Numbers
opt.relativenumber = true

-- Auto-reload
vim.cmd([[
  autocmd FocusGained,BufEnter * checktime
]])

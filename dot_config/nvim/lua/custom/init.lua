local opt = vim.opt

-- Debugging
-- vim.lsp.set_log_level("debug")

-- Numbers
opt.relativenumber = true

-- Auto-reload
vim.cmd([[
  autocmd FocusGained,BufEnter * checktime
]])

-- Add binaries installed by mason.nvim to path (see https://github.com/williamboman/mason.nvim/issues/1289#issuecomment-1549875448)
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

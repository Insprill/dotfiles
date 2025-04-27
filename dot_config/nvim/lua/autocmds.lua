local autocmd = vim.api.nvim_create_autocmd

-- Show Nvdash when all buffers are closed
-- https://nvchad.com/docs/recipes#show_nvdash_when_all_buffers_are_closed
autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

-- Restore cursor position
-- https://nvchad.com/docs/recipes#restore_cursor_position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Don't auto-insert comment leader when going to a newline.
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove { "r", "o" }
  end,
})

-- Fix errors when restoring a session that had a roslyn source generated file open.
-- https://github.com/seblyng/roslyn.nvim/issues/351
vim.api.nvim_create_autocmd("User", {
  pattern = "PersistenceSavePre",
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match "roslyn%-source%-generated://" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})

-- Super hack to fix inline diagnostics sometimes not showing.
-- Without this, doing things like deleting a semi-colon will show
-- that there's an error everywhere except the actual location of the error.
-- Using the <leader>dt bind would restore it, which led me to this workaround
-- which doesn't change any config options, but does result in diagnostics showing correctly.
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.cs" },
  callback = function()
    vim.diagnostic.config {}
  end,
})

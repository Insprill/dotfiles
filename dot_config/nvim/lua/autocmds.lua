local autocmd = vim.api.nvim_create_autocmd

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

-- Fix nvim-tree not restoring with sessions correctly.
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "NvimTree*",
  callback = function()
    local api = require "nvim-tree.api"
    local view = require "nvim-tree.view"

    if not view.is_visible() then
      api.tree.open()
    end
  end,
})

-- Auto refresh codelens
local codelens_augroup = vim.api.nvim_create_augroup("lsp_codelens_refresh", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = codelens_augroup,
  callback = function(args)
    local buf = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client ~= nil and client.server_capabilities and client.server_capabilities.codeLensProvider then
      vim.api.nvim_clear_autocmds({
        group = codelens_augroup,
        buffer = buf,
      })
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        group  = codelens_augroup,
        buffer = buf,
        callback = vim.lsp.codelens.refresh
      })
    end
  end,
})

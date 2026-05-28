require "nvchad.mappings"

local map = vim.keymap.set

--
-- Git
--
map("n", "<leader>gb", ":Gitsigns blame_line<CR>")
map("n", "<leader>gB", ":Gitsigns blame<CR>")

--
-- LSP
--
map("n", "ga", function()
  vim.lsp.buf.code_action()
end)
local use_virtual_text = true
map("n", "<leader>dt", function()
  use_virtual_text = not use_virtual_text
  vim.diagnostic.config {
    virtual_text = use_virtual_text,
    virtual_lines = not use_virtual_text,
  }
end, { desc = "Toggle diagnostics: virtual text ↔ virtual lines" })

----------------------
-- Removed Bindings --
----------------------
local del = vim.keymap.del

--
-- Telescope (replaced by snacks)
--
del("n", "<leader>ff")
del("n", "<leader>fa")
del("n", "<leader>fw")
del("n", "<leader>fb")
del("n", "<leader>fh")
del("n", "<leader>ma")
del("n", "<leader>fo")
del("n", "<leader>fz")
del("n", "<leader>cm")
del("n", "<leader>gt")

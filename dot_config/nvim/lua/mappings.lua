require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>km", ":Telescope keymaps<CR>")
map("n", "<leader>ds", ":Telescope diagnostics<CR>")
map("n", "<leader>dt", function()
  local cfg = vim.diagnostic.config()
  vim.diagnostic.config {
    virtual_text = not cfg.virtual_text,
    virtual_lines = cfg.virtual_text,
  }
end, { desc = "Toggle diagnostics: virtual text ↔ virtual lines" })

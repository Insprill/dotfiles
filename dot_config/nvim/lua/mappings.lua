require "nvchad.mappings"

-- disabled mappings
local nomap = vim.keymap.del
-- nomap("i", "<TAB>")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>km", ":Telescope keymaps<CR>")
-- map("i", "<leader>pa", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
-- })
-- vim.g.copilot_no_tab_map = true

-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  changed_themes = {
    catppuccin = {
      base_30 = {
        blue = "#CBA6F7",
        folder_bg = "#CBA6F7",
      },
    },
  },
}

M.ui = {
  cmp = {
    icons_left = true,
    style = "atom_colored",
    abbr_maxwidth = 120,
  },
  telescope = {
    style = "bordered",
  },
}

M.nvdash = {
  load_on_startup = true,
  -- Copied from NvChad config, shortcuts modified.
  -- https://github.com/NvChad/ui/blob/4466c87073c811c22b14215ba8a0cfc7d1b8b688/lua/nvconfig.lua#L62-L80
  buttons = {
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "  Mappings", keys = "km", cmd = "Telescope keymaps" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.cheatsheet = {
  theme = "simple", -- grid view goes off-screen
}

-- This is super hacky, but necessary for nvim-treesitter to work
-- properly on Windows. Using CC or GCC will cause Neovim to crash
-- as soon as a treesitter is loaded. Using zig causes nothing to
-- compile at all. Setting "require 'nvim-treesitter.install'.compilers"
-- to "zig" in the plugins' init function works, but not for the first
-- install, since the compilation process starts before init is called.
-- This ends up being the only way to get everything fully functional
-- the first time nvim-treesitter is installed.
if jit.os == "Windows" then
  vim.fn.setenv("CC", "clang")
end

return M

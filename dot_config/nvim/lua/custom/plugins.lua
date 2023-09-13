local overrides = require("custom.configs.overrides")

local plugins = {
  -- Custom Plugins
  {
    "github/copilot.vim",
    lazy = false
  },
  {
    "saecki/crates.nvim",
  },
  {
    "vuki656/package-info.nvim",
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    keys = {
      {
        "<leader>nu",
        "<cmd>lua require('package-info').update()<cr>",
        desc = "Update Dependencies",
        silent = true,
        noremap = true
      }
    },
    opts = overrides.package_info,
    lazy = false
  },
  {
    "andweeb/presence.nvim",
    lazy = false
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false
  },

  -- override plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context" -- Custom plugin
    },
    opts = overrides.treesitter
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "sindrets/diffview.nvim", -- Custom plugin
    },
    opts = overrides.gitsigns,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
       require "plugins.configs.lspconfig"
       require "custom.configs.lspconfig"
    end,
  },
}

return plugins


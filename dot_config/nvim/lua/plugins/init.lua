return {
  {
    "saecki/crates.nvim",
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
    "vuki656/package-info.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = { "BufRead package.json" },
    keys = require("configs.package-info").keys,
    opts = require("configs.package-info").opts,
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
    opts = require "configs.presence",
  },

  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = require "configs.roslyn",
  },

  {
    "ThePrimeagen/vim-be-good",
    lazy = false,
  },

  --
  -- NvChad plugin overrides
  --
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = require "configs.lspconfig",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.treesitter").opts,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },
}

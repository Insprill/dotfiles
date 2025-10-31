return {
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "NMAC427/guess-indent.nvim",
    event = "BufReadPost",
    config = function()
      require("guess-indent").setup()
    end,
  },

  {
    "nvim-java/nvim-java",
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
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    ft = { "markdown" },
  },

  {
    "vuki656/package-info.nvim",
    event = { "BufRead package.json" },
    keys = require("configs.package-info").keys,
    opts = require("configs.package-info").opts,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { dir = vim.fn.stdpath "state" .. "/sessions/" }, -- Should be default but doesn't work
  },

  {
    "andweeb/presence.nvim",
    event = "BufReadPost",
    opts = require "configs.presence",
  },

  {
    "unblevable/quick-scope",
    event = "BufReadPost",
  },

  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = require "configs.roslyn",
  },

  {
    "folke/snacks.nvim",
    -- This shouldn't be lazy loaded, but we need to
    -- delete the NvChad Telescope binds before loading
    -- or some of them will take precedence.
    -- lazy = false,
    -- priority = 1000,
    event = "VeryLazy",
    keys = require("configs.snacks").keys,
    opts = require("configs.snacks").opts,
  },

  {
    "insprill/unity-nvim-adapter",
    lazy = false,
  },

  {
    "lambdalisue/vim-suda",
    event = "BufReadPost",
  },

  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },

  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
    event = "ModeChanged *:[vV\22]",
  },

  --
  -- NvChad plugin overrides
  --

  -- https://github.com/NvChad/NvChad/discussions/3244
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },

  {
    "neovim/nvim-lspconfig",
    config = require "configs.lspconfig",
  },

  {
    "nvim-telescope/telescope.nvim",
    config = require "configs.telescope",
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

  {
    "mason-org/mason.nvim",
    opts = require "configs.mason",
  },
}

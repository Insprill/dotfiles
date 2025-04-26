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
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    config = require "configs.lazygit",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    -- Must be before nvim-lspconfig!
    "nvim-java/nvim-java",
    config = function()
      require("java").setup()
    end,
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
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = { "BufRead package.json" },
    keys = require("configs.package-info").keys,
    opts = require("configs.package-info").opts,
  },

  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = require "configs.presence",
  },

  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = require "configs.roslyn",
  },

  {
    "ThePrimeagen/vim-be-good",
    event = "VeryLazy",
  },

  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
    event = "ModeChanged *:[vV\22]",
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
}

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "bash-language-server",
        "clang-format",
        "csharp-language-server",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "gopls",
        "html-lsp",
        "hyprls", -- https://github.com/mason-org/mason-registry/pull/5612/files
        "json-lsp",
        "lua-language-server",
        "powershell-editor-services",
        "pylyzer",
        "rust-analyzer",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        -- Formatting
        "beautysh",
        "black",
        "cbfmt",
        "csharpier",
        "eslint_d",
        "prettierd",
        "rustywind",
        "stylua",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "c_sharp",
        "diff",
        "dockerfile",
        "fish",
        "gdscript",
        "gdshader",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "git_config",
        "git_rebase",
        "glsl",
        "go",
        "groovy",
        "hlsl",
        "html",
        "ini",
        "java",
        "javascript",
        "json",
        "lua",
        "kotlin",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "rasi",
        "regex",
        "requirements", -- pip requirements
        "rust",
        "scss",
        "ssh_config",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "wgsl",
        "wgsl_bevy",
        "xml",
        "yaml",
      },
    },
  },

  -- Custom Plugins

  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  -- },

  {
    "Fymyte/rasi.vim",
    ft = { "rasi" },
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "vuki656/package-info.nvim",
    event = { "BufRead package.json" },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>nu",
        "<cmd>lua require('package-info').update()<cr>",
        desc = "Update Dependencies",
        silent = true,
        noremap = true,
      },
    },
    opts = {
      package_info = {
        package_manager = "pnpm",
      },
    },
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
  },

  {
    "ThePrimeagen/vim-be-good",
    lazy = false,
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Settings Overrides
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
}

local M = {}

-- Show inline blame
M.gitsigns = {
  current_line_blame = true
}

-- Git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.treesitter = {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "c_sharp",
    "css",
    "dockerfile",
    "git_config",
    "gitignore",
    "html",
    "javascript",
    "json",
    "markdown",
    "markdown_inline",
    "regex",
    "rust",
    "svelte",
    "toml",
    "typescript",
    "yaml",
  },
}

M.mason = {
  -- :Mason
  ensure_installed = {
    -- LSP
    "csharp-language-server",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "grammarly-languageserver",
    "json-lsp",
    "rust-analyzer",
    -- "omnisharp",
    "svelte-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "yaml-language-server",
    -- Actions
    "eslint_d",
    -- Formatting
    "cbfmt",
    "csharpier",
    "prettierd",
    "rustfmt",
    "rustywind",
    -- Linting
    "actionlint",
    "deno",
    "jsonlint",
    "yamllint",
  }
}

return M
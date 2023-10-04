local M = {}

-- Show inline blame
M.gitsigns = {
  current_line_blame = true
}

-- Git support in nvimtree
M.nvimtree = {
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
}

M.treesitter = {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "bash",
    "c_sharp",
    "css",
    "dockerfile",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitignore",
    "html",
    "ini",
    "java",
    "javascript",
    "json",
    "lua",
    "kotlin",
    "python",
    "markdown",
    "markdown_inline",
    "regex",
    "rust",
    "svelte",
    "toml",
    "typescript",
    "xml",
    "yaml",
  },
}

M.mason = {
  -- :Mason
  ensure_installed = {
    -- LSP
    "bash-language-server",
    "csharp-language-server",
    "css-lsp",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "gradle-language-server",
    "grammarly-languageserver",
    "jdtls",
    "json-lsp",
    "lua-language-server",
    "kotlin-language-server",
    "powershell-editor-services",
    "rust-analyzer",
    "svelte-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "yaml-language-server",
    -- Actions
    "eslint_d",
    -- Formatting
    "beautysh",
    "cbfmt",
    "csharpier",
    "prettierd",
    "rustywind",
    -- Linting
    "actionlint",
    "deno",
    "jsonlint",
    "yamllint",
  }
}

M.package_info = {
  package_manager = "pnpm"
}

return M

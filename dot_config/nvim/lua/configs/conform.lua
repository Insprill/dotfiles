local options = {
  -- :help conform-formatters | https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
  formatters_by_ft = {
    -- Configs
    lua = { "stylua" },
    yaml = { "prettierd" },
    json = { "prettierd" },
    -- General Languages
    c = { "clang-format" },
    cpp = { "clang-format" },
    csharp = { "csharpier" },
    go = { "gofmt" },
    python = { "black" },
    rust = { "rustfmt" },
    -- Shell Scripting
    bash = { "beautysh" },
    shell = { "beautysh" },
    -- Web Dev
    css = { "prettierd", "eslint_d" },
    html = { "prettierd", "eslint_d", "rustywind" },
    javascript = { "prettierd", "eslint_d", "rustywind" },
    typescript = { "prettierd", "eslint_d", "rustywind" },
    -- Text
    markdown = { "cbfmt" },
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)

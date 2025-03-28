return {
  -- :help conform-formatters | https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
  formatters_by_ft = {
    -- Configs
    lua = { "stylua" },
    yaml = { "prettierd" },
    json = { "prettierd" },
    -- General Languages
    c = { "clang-format" },
    cpp = { "clang-format" },
    cs = { "csharpier" },
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
    markdown = { "mdformat" },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

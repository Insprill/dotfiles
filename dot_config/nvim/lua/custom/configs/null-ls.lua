local null_ls = require "null-ls"

local format = null_ls.builtins.formatting
local action = null_ls.builtins.code_actions
local lint = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
  action.eslint_d,
  format.beautysh,
  format.cbfmt,
  format.csharpier,
  format.deno_fmt, -- JS,TS,JSX,TSX,JSON
  format.prettierd,
  format.rustfmt,
  format.rustywind,
  lint.actionlint, -- GitHub Actions
  lint.deno_lint, -- JS/TS
  lint.eslint_d,
  lint.jsonlint,
  lint.yamllint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

require('crates').setup {
  null_ls = {
      enabled = true,
      name = "crates.nvim",
  },
}


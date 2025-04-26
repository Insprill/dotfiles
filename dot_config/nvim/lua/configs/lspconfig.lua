-- :help lspconfig-all | https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  bashls = {},
  clangd = {
    capabilities = {
      textDocument = {
        completion = {
          editsNearCursor = true,
        },
      },
      offsetEncoding = "utf-16",
    },
  },
  crates = {},
  cmake = {},
  cssls = {},
  docker_compose_language_service = {},
  dockerls = {},
  gopls = {},
  harper_ls = {
    filetypes = { "markdown", "text", "gitcommit" },
  },
  hyprls = {},
  jdtls = {},
  jsonls = {},
  lua_ls = {},
  marksman = {},
  powershell_es = {},
  pylyzer = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
  svelte = {},
  tailwindcss = {},
  ts_ls = {},
  yamlls = {},
}

return function()
  require("nvchad.configs.lspconfig").defaults()

  -- Merge nvim-lsp-file-operations capabilities
  local nvlsp = require "nvchad.configs.lspconfig"
  nvlsp.capabilities =
    vim.tbl_deep_extend("force", nvlsp.capabilities, require("lsp-file-operations").default_capabilities())

  for name, opts in pairs(servers) do
    vim.lsp.enable(name)
    vim.lsp.config(name, opts)
  end
end

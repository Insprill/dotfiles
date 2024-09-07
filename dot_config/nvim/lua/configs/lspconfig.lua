require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- :help lspconfig-all | https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "bashls",
  "clangd",
  --  "crates", -- Setup later
  --  "csharp_ls", -- Setup later
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "gopls",
  "grammarly",
  "hyprls",
  "jsonls",
  "lua_ls",
  "powershell_es",
  "pylyzer",
  -- "rust_analyzer", -- Setup later
  "svelte",
  "tailwindcss",
  "ts_ls",
  "yamlls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Crates | Rust crate version checking
require("crates").setup {
  lsp = {
    on_attach = nvlsp.on_attach,
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
}

-- C# | Add support for decompilation
lspconfig.csharp_ls.setup {
  handlers = {
    ["textDocument/definition"] = require("plugins.csharpls_extended.lua.csharpls_extended").handler,
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Rust | Enable all features by default
lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
}

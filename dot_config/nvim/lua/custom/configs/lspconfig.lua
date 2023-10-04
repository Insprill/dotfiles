local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "bashls",
--  "csharp_ls", -- Setup later
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  -- "gradle_ls", -- Setup later
  "grammarly",
  "jdtls",
  "jsonls",
  "lua_ls",
  -- "kotlin_language_server", -- Doesn't like Gradle build scripts :/
  "powershell_es",
  -- "rust_analyzer", -- Setup later
  "svelte",
  "tailwindcss",
  "tsserver",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Gradle | Add support for the kotlin file type
lspconfig.gradle_ls.setup {
  filetypes = { "groovy", "kotlin" },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- C# | Add support for decompilation
lspconfig.csharp_ls.setup {
  handlers = {
    ["textDocument/definition"] = require('custom.csharpls_extended.lua.csharpls_extended').handler,
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Rust | Enable all features by default 
lspconfig.rust_analyzer.setup{
  settings = {
    ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  capabilities=capabilities,
  on_attach=on_attach,
}


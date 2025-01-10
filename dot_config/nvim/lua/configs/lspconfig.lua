return function()
  require("nvchad.configs.lspconfig").defaults()

  local lspconfig = require "lspconfig"
  local nvlsp = require "nvchad.configs.lspconfig"

  -- :help lspconfig-all | https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
  local servers = {
    "bashls",
    "cmake",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "harper_ls",
    "hyprls",
    "jsonls",
    "lua_ls",
    "powershell_es",
    "pylyzer",
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

  -- clangd
  lspconfig.clangd.setup {
    capabilities = {
      textDocument = {
        completion = {
          editsNearCursor = true,
        },
      },
      offsetEncoding =  'utf-16',
    },
    on_init = nvlsp.on_init,
    on_attach = nvlsp.on_attach,
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

  require("roslyn").setup {
    config = {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    },
  }
end

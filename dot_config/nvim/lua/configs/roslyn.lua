return {
  config = {
    filewatching = false,
    settings = {
      ["csharp|background_analysis"] = {
        background_analysis = {
          dotnet_analyzer_diagnostics_scope = "fullSolution",
          dotnet_compiler_diagnostics_scope = "fullSolution",
        },
      },
    },
  },

  capabilities = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Extend existing capabilities without overwriting them
    capabilities = vim.tbl_deep_extend("force", capabilities, {
      textDocument = {
        foldingRange = {
          dynamicRegistration = true,
          lineFoldingOnly = true,
        },
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    })

    return capabilities
  end,
}

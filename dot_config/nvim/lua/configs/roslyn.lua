return {
  config = {
    filewatching = "roslyn",
    settings = {
      ["csharp|background_analysis"] = {
        dotnet_analyzer_diagnostics_scope = "fullSolution",
        dotnet_compiler_diagnostics_scope = "fullSolution",
      },
      ["csharp|code_lens"] = {
        dotnet_enable_references_code_lens = true,
      },
      ["csharp|completion"] = {
        dotnet_provide_regex_completions = true,
        dotnet_show_completion_items_from_unimported_namespaces = true,
        dotnet_show_name_completion_suggestions = true,
      },
      ["csharp|inlay_hints"] = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true,
        csharp_enable_inlay_hints_for_implicit_variable_types = true,
        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
        csharp_enable_inlay_hints_for_types = true,
        dotnet_enable_inlay_hints_for_indexer_parameters = true,
        dotnet_enable_inlay_hints_for_literal_parameters = true,
        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
        dotnet_enable_inlay_hints_for_other_parameters = true,
        dotnet_enable_inlay_hints_for_parameters = true,
        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
      },
      ["csharp|symbol_search"] = {
        dotnet_search_reference_assemblies = true,
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

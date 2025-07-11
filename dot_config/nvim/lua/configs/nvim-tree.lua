return {
  auto_reload_on_write = false, -- Slows down huge projects
  select_prompts = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
  },
  filesystem_watchers = {
    enable = true,
    ignore_dirs = {
      -- Generic
      ".git",
      "build",
      -- Rust
      "target",
      -- Web
      "node_modules",
      -- Unity
      "Library.*",
      "Logs",
      "MemoryCaptures",
      "obj",
      "ProfileAnalyzer",
      "Temp",
    },
  },
  filters = {
    git_ignored = false,
  },
  git = {
    enable = true,
    timeout = 1000,
  },
  renderer = {
    full_name = true,
    group_empty = true,
    highlight_git = "name",
    highlight_diagnostics = "icon",
  },
  ui = {
    confirm = {
      trash = false,
    },
  },
  view = {
    number = true,
    relativenumber = true,
    width = {
      max = 64,
      padding = 0,
    },
  },
}

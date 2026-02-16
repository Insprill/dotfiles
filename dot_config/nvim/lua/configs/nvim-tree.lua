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
      "^.git$",
      -- C#
      "^obj$",
      -- Java
      "^\\.gradle$",
      -- Rust
      "^target$",
      -- Unity
      "^Library.*",
      "^Temp$",
      -- Web
      "^node_modules$",
    },
  },
  filters = {
    git_ignored = false,
    custom = {
      -- Generic
      "^.git$",
      -- C#
      "^obj$",
      "*.csproj",
      "*.sln",
      "*.slnx",
      -- Rust
      "^target$",
      -- Unity
      "Library.*",
      "*.meta",
      -- Web
      "^node_modules$",
    },
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

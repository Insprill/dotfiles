return {
  auto_reload_on_write = false, -- Slows down huge projects
  filesystem_watchers = {
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
  git = {
    timeout = 1000,
  },
  renderer = {
    highlight_git = true,
  },
  filters = {
    git_ignored = false,
  },
}

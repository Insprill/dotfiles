return {
  filesystem_watchers = {
    ignore_dirs = {
      "node_modules",
      "Library",
      "Temp",
      "build",
      "target",
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 10000,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

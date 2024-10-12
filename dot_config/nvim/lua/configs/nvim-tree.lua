return {
  filesystem_watchers = {
    ignore_dirs = {
      "node_modules",
      "Library",
      "Temp",
    },
  },
  git = {
    enable = true,
    ignore = false,
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

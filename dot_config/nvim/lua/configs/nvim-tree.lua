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
    timeout = 2500,
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

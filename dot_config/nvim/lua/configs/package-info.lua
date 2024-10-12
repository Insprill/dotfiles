return {
  keys = {
    {
      "<leader>nu",
      "<cmd>lua require('package-info').update()<cr>",
      desc = "Update Dependencies",
      silent = true,
      noremap = true,
    },
  },
  opts = {
    package_info = {
      package_manager = "pnpm",
    },
  },
}

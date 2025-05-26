return {
  ---@class snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        -- Left Pane
        { pane = 1, section = "header" },
        { pane = 1, section = "keys", gap = 1, padding = 1 },
        { pane = 1, section = "startup", padding = 1 },
        -- Right Pane
        { pane = 2, section = "projects", icon = " ", title = "Projects", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files In ", file = vim.fn.fnamemodify(".", ":~") },
        { pane = 2, section = "recent_files", cwd = true, indent = 2, padding = 1 },
        { pane = 2, section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1 },
      },
    },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    picker = {
      enabled = true,
      -- By default, tab/shift-tab SELECTS and moves to the next element.
      -- This almost always results in the appearance of the picker opening
      -- a completely random file instead of what you actually wanted :D
      win = {
        -- input window
        input = {
          keys = {
            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
          },
        },
        -- result list window
        list = {
          keys = {
            ["<S-Tab>"] = { "list_up", mode = { "n", "x" } },
            ["<Tab>"] = { "list_down", mode = { "n", "x" } },
          },
        },
      },
    },
    scroll = {
      enabled = true,
      animate = {
        easing = "outQuad",
        duration = {
          step = 10,
          total = 80,
        },
      },
    },
  },
  keys = {
-- stylua: ignore start
    -- Find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- Git Browse
    { "<leader>go",  function() Snacks.gitbrowse.open() end, desc = "Open the current file in GitHub/GitLab/BitBucket" },
    -- Lazygit
    { "<leader>lg", function() Snacks.lazygit.open() end, desc = "Open Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Open Git log in Lazygit" },
    { "<leader>gL", function() Snacks.lazygit.log_file() end, desc = "Open Git log for the current file in Lazygit" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>SS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- Search
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>:",  function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    -- stylua: ignore end
  },
}

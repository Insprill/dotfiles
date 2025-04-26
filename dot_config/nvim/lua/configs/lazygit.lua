return function()
  -- Open Lazygit with cmd on Windows.
  -- Using PowerShell causes a blank window.
  if jit.os == "Windows" then
    vim.schedule(function()
      vim.api.nvim_create_user_command("LazyGit", function()
        local current = vim.opt.shell
        vim.opt.shell = "cmd"
        require("lazygit").lazygit()
        vim.opt.shell = current
      end, { force = true })
    end)
  end

  -- Close the border window.
  -- We use the new winborder option in Neovim,
  -- so without this we end up with two borders.
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lazygit",
    callback = function()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local cfg = vim.api.nvim_win_get_config(win)
        if cfg.relative ~= "" and win ~= vim.api.nvim_get_current_win() then
          vim.api.nvim_win_close(win, true)
        end
      end
    end,
  })
end

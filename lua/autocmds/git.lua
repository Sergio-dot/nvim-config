local function refresh_git()
  vim.schedule(function()
    -- Refresh Gitsigns
    local ok_gs, gitsigns = pcall(require, "gitsigns")
    if ok_gs and type(gitsigns.refresh) == "function" then
      gitsigns.refresh()
    end

    -- Refresh Neo-tree
    local ok_mgr, manager = pcall(require, "neo-tree.sources.manager")
    if ok_mgr then
      local state = manager.get_state("filesystem")
      if state then
        local ok_fs, fs = pcall(require, "neo-tree.sources.filesystem")
        if ok_fs and type(fs.refresh) == "function" then
          fs.refresh(state)
        end
      end
    end
  end)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "FugitiveChanged",
  callback = refresh_git,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "TermClose" }, {
  callback = function()
    vim.cmd("checktime")
    refresh_git()
  end,
})

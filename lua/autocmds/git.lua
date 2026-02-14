vim.api.nvim_create_autocmd("User", {
  pattern = "FugitiveChanged",
  callback = function()
    local ok_mgr, manager = pcall(require, "neo-tree.sources.manager")
    if not ok_mgr then return end
    local state = manager.get_state("filesystem")
    if not state then return end
    local ok_fs, fs = pcall(require, "neo-tree.sources.filesystem")
    if not ok_fs then return end
    fs.refresh(state)
  end,
})

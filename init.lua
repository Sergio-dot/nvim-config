-- options
-- vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- faster redraw
vim.opt.lazyredraw = true

-- reduce cursor hold delay (used by diagnostics, LSP, etc.)
vim.opt.updatetime = 200

-- faster key sequence timeout
vim.opt.timeoutlen = 300

-- avoid swapfile churn
vim.opt.swapfile = false

-- reduce file system checks
vim.opt.backup = false
vim.opt.writebackup = false

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
	},
})

-- plugins
require("lazy").setup("plugins")

-- keymaps
require("keymaps")

-- autocmds
require("autocmds.git")

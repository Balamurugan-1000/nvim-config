-- -- Bootstrap lazy.nvim
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
-- 	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
-- 	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
-- 	if vim.v.shell_error ~= 0 then
-- 		vim.api.nvim_echo({
-- 			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
-- 			{ out, "WarningMsg" },
-- 			{ "\nPress any key to exit..." },
-- 		}, true, {})
-- 		vim.fn.getchar()
-- 		os.exit(1)
-- 	end
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- -- Make sure to setup `mapleader` and `maplocalleader` before
-- -- loading lazy.nvim so that mappings are correct.
-- -- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
--
-- -- Setup lazy.nvim
-- require("lazy").setup({
-- 	spec = {
-- 		-- import your plugins
-- 		{ import = "plugins" },
-- 	},
-- 	-- Configure any other settings here. See the documentation for more details.
-- 	-- colorscheme that will be used when installing plugins.
-- 	install = { colorscheme = { "habamax" } },
-- 	-- automatically check for plugin updates
-- 	checker = { enabled = true },
-- })

-- ⛩️ LEADER first (before loading any plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 🛠️ VIM OPTIONS
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })

-- 📦 Lazy Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("config.options") -- loads lua/config/options.lua
require("config.keymaps") -- loads lua/config/keymaps.lua
require("config.autocmds") -- loads lua/config/keymaps.lua
-- 🪄 Load plugins via Lazy
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = { colorscheme = { "catppuccin", "tokyonight", "habamax" } },
	checker = { enabled = true },
	change_detection = {
		notify = false, -- don't spam "config reloaded" messages
	},
})

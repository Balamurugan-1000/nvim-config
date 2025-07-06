-- 👋 Autocommands are grouped here
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local KaizenGroup = augroup("KaizenAutocmds", { clear = true })

-- 🧹 Trim trailing whitespace on save
autocmd({ "BufWritePre" }, {
	group = KaizenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- 🧼 Auto reload files changed outside of Neovim
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	group = KaizenGroup,
	command = "checktime",
})

-- 📝 Auto create missing directories before saving a file
autocmd("BufWritePre", {
	group = KaizenGroup,
	callback = function(event)
		local filepath = vim.fn.fnamemodify(event.match, ":p:h")
		if vim.fn.isdirectory(filepath) == 0 then
			vim.fn.mkdir(filepath, "p")
		end
	end,
})

-- 📦 Load API safely
local api = vim.api

-- 📛 Define or reuse your autogroup
local KaizenGroup = api.nvim_create_augroup("KaizenAutocmds", { clear = true })

-- 🔄 Reload config on file save
api.nvim_create_autocmd("BufWritePost", {
	group = KaizenGroup,
	pattern = {
		"init.lua",
		"lua/config/*.lua",
		"lua/plugins/*.lua",
	},
	command = "source <afile> | Lazy reload",
	desc = "Reload init.lua and lazy config on write",
})

-- 🔤 Set filetype for JSX/TSX extensions
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = KaizenGroup,
	pattern = { "*.es6", "*.tsx", "*.jsx" },
	command = "set filetype=javascriptreact",
	desc = "Set filetype to javascriptreact for .jsx/.tsx/.es6",
})

-- 💬 Show diagnostics on hover
api.nvim_create_autocmd("CursorHold", {
	group = KaizenGroup,
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
	desc = "Show diagnostics popup on hover",
})

-- ✨ Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	group = KaizenGroup,
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
	desc = "Highlight yanked text",
})

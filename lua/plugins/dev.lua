return {
	-- 📂 File Explorer (Neo-tree)

	-- 🧠 Sticky code context (top line)
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { mode = "cursor", separator = "-" },
		keys = {
			{ "<leader>tc", "<cmd>TSContextToggle<cr>", desc = "Toggle Context" },
		},
	},

	-- 🔁 Undo tree
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
		},
	},

	-- 📌 Quick file bookmarks
	-- 🧠 LSP Signature popup while typing
	{
		"ray-x/lsp_signature.nvim",
		event = "LspAttach",
		opts = {
			bind = true,
			handler_opts = { border = "rounded" },
			hint_enable = false,
		},
	},

	-- 🐞 Trouble UI for diagnostics and LSP lists
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "TroubleToggle",
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
			{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
			{ "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References" },
		},
	},
}

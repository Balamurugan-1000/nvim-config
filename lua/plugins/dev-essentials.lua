return {
	-- 🪄 Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- ✨ Commenting
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},

	-- 📐 Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│" },
			scope = { enabled = false },
		},
	},

	-- 🧠 Better diagnostics list & quickfix
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- 🔍 Powerful search interface

	-- 📄 Git integration
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- 🔁 Surround text objects
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- 🌀 Smooth scroll (native-style)
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				easing_function = "sine",
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
			})
		end,
	},
}

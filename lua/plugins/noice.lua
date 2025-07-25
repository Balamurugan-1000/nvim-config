return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline",
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = {
					pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
					icon = "",
					lang = "lua",
				},
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = { view = "cmdline_input", icon = "󰥻 " },
			},
		},

		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},

		popupmenu = {
			enabled = true,
			backend = "nui",
			kind_icons = {}, -- can set to `false` if you want no icons
		},

		notify = {
			enabled = true,
			view = "notify",
		},

		lsp = {
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30,
				view = "mini",
			},
			hover = {
				enabled = true,
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true,
					luasnip = true,
					throttle = 50,
				},
			},
			message = {
				enabled = true,
				view = "notify",
			},
			documentation = {
				view = "hover",
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
				["cmp.entry.get_documentation"] = false,
			},
		},

		markdown = {
			hover = {
				["|(%S-)|"] = vim.cmd.help,
				["%[.-%]%((%S-)%)"] = require("noice.util").open,
			},
			highlights = {
				["|%S-|"] = "@text.reference",
				["@%S+"] = "@parameter",
				["^%s*(Parameters:)"] = "@text.title",
				["^%s*(Return:)"] = "@text.title",
				["^%s*(See also:)"] = "@text.title",
				["{%S-}"] = "@parameter",
			},
		},

		presets = {
			bottom_search = true,
			command_palette = false,
			long_message_to_split = false,
			inc_rename = false,
			lsp_doc_border = true, -- ✅ this adds border to hover/docs
		},

		health = {
			checker = true,
		},
	},

	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}

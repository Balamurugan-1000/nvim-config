return {
	{
		"saghen/blink.cmp",
		version = "1.*",

		dependencies = {
			"rafamadriz/friendly-snippets",
		},

		opts = {
			-- 🎯 Use Enter to accept selection
			keymap = { preset = "enter" },

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = false },
			},

			sources = {
				default = {
					"lsp", -- 🔧 Language Server Protocol
					"snippets", -- ✂️ Snippet engine (via friendly-snippets)
					"path", -- 📁 File system paths
					"buffer", -- 📄 Words from current buffer
					"cmdline", -- 💻 Command-line mode
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},

		opts_extend = { "sources.default" },
	},
}

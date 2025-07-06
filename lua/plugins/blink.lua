return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets", -- Snippets source (optional)
		},
		version = "1.*", -- Use latest compatible release
		-- If you use Rust Nightly and want to build:
		-- build = "cargo build --release",

		opts = {
			-- Keymap style
			keymap = { preset = "default" },

			-- Adjust appearance if needed
			appearance = {
				nerd_font_variant = "mono", -- or "normal"
			},

			-- Docs popup only when triggered manually
			completion = {
				documentation = { auto_show = false },
			},

			-- Completion sources
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Use the fast fuzzy matcher with fallback
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},

		-- Important! This tells Lazy to extend config from other places
		opts_extend = { "sources.default" },
	},
}

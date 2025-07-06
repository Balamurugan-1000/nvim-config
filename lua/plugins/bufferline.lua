return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy", -- Lazy load for better startup
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- Or "tabs"
				numbers = "ordinal", -- "none", "buffer_id", "ordinal", "both"
				indicator = {
					icon = "▎", -- This fancy lil line 📌
					style = "icon",
				},
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",

				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,

				offsets = {
					{
						filetype = "NvimTree",
						text = "🌲 File Explorer",
						text_align = "center",
						separator = true,
					},
				},

				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,

				separator_style = "slant", -- "slant" | "padded_slant" | "thick" | "thin"
				enforce_regular_tabs = false,
				always_show_bufferline = true,
			},
			highlights = {
				fill = {
					bg = "#1e1e2e",
				},
				background = {
					fg = "#888888",
					bg = "#1e1e2e",
				},
				buffer_selected = {
					fg = "#ffffff",
					bold = true,
					italic = true,
				},
			},
		})

		-- Optional Keymaps 🎯
		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
		vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "Close Buffer" })
	end,
}

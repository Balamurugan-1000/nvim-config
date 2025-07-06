return {
	-- 🔧 Mason
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	-- 🔌 Mason-LSPConfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"jsonls",
					"pyright",
				},
				automatic_installation = true,
			})
		end,
	},

	-- 💡 LSP Setup
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"saghen/blink.cmp",
				opts = {}, -- ensure it's fully initialized first
			},
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- 🛠️ FIX: Load only if blink.cmp is fully available
			local blink = require("blink.cmp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				blink.lsp_capabilities or {} -- fallback to empty table
			)

			local on_attach = function(_, bufnr)
				local map = vim.keymap.set
				local opts = { buffer = bufnr, silent = true, noremap = true }

				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "[d", vim.diagnostic.goto_prev, opts)
				map("n", "]d", vim.diagnostic.goto_next, opts)
				map("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end

			local servers = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"pyright",
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end,
	},
	-- 🧼 Formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					sh = { "shfmt" },
					python = { "black" },
				},
			})
		end,
	},

	-- ⚡ Completion
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = {
				keymap = {
					preset = "none", -- disable default presets
					show = "<C-Space>", -- open menu
					cancel = "<C-e>", -- close menu
					accept = "<CR>", -- confirm current selection (auto selects top if nothing is selected)
					select_next = "<Tab>",
					select_prev = "<S-Tab>",
				},
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
		opts_extend = { "sources.default" },
	},
	-- 🌲 Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"typescript",
					"javascript",
					"html",
					"css",
					"json",
					"bash",
					"python",
					"htmldjango",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
					title = true,
					winblend = 10,
					code_action = "", -- 💡 REMOVE THE BULB ICON!
				},
				code_action = {
					enable = false, -- 🔕 Disable the auto virtual icon
					show_server_name = false,
				},
				hover = {
					max_width = 0.7,
					max_height = 0.4,
				},
			})
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
}

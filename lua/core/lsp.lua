-- ~/.config/nvim/lua/core/lsp.lua

-- 🧱 Setup mason
require("mason").setup()

-- 📦 Bridge mason <-> lspconfig
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls", -- ✅ NEW TypeScript LSP
		"html",
		"cssls",
		"jsonls",
		"bashls",
		"pyright",
	},
	automatic_installation = true,
})

-- 🧠 Setup LSP
local lspconfig = require("lspconfig")

-- 🔮 Add blink.cmp capabilities
local capabilities =
	vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("blink.cmp").lsp_capabilities())

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

-- 🌐 List of LSPs
local servers = {
	"lua_ls",
	"ts_ls", -- 🆕 TypeScript LSP
	"html",
	"cssls",
	"jsonls",
	"bashls",
	"pyright",
}

-- ⚙️ Setup loop
for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- 🧼 Setup conform.nvim (Formatter)
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

-- 🌲 Treesitter Setup
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

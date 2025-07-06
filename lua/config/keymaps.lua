local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ─────────────────────────────────────
-- 🧠 LSP Saga Keymaps
-- ─────────────────────────────────────
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation", silent = true })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action", silent = true })
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition", silent = true })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostic", silent = true })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic", silent = true })
vim.keymap.set("n", "G", "G", { noremap = true, silent = true, desc = "Go to last line" })

-- ─────────────────────────────────────
-- 💻 General Editor Utilities
-- ─────────────────────────────────────
map("n", "<leader>;", ":lua Snacks.dashboard()<CR>", { desc = "Open Dashboard", noremap = true, silent = true })
map("n", "<leader>xh", ":nohlsearch<CR>", { desc = "Clear Search Highlights", noremap = true, silent = true })

map("n", "<C-w>", ":bd<CR>", { desc = "Close Buffer", noremap = true, silent = true })
map("n", "<leader>w", ":w<CR>", { desc = "Save File", noremap = true, silent = true })

-- 📋 Copy to Clipboard
map("n", "<leader>c", '"+y', { desc = "Copy to Clipboard" })

-- 🔁 Buffer Navigation (BufferLine)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- 🔍 File Navigation
map("n", "<C-p>", ":Telescope find_files<CR>", opts)

-- 🧹 Disable annoying double leader press
map("n", "<leader><leader>", "<nop>", opts)

-- ─────────────────────────────────────
-- ✨ VM Plugin – Add Cursor
-- ─────────────────────────────────────
map("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts) -- Add cursor below
map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts) -- Add cursor above
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<CR>", { desc = "Workspace Diagnostics" })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics toggle<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Quickfix in Trouble" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List" })

-- ─────────────────────────────────────
-- 🎯 Cursor Style Toggle
-- ─────────────────────────────────────
local is_block = true

map("n", "<leader>cb", function()
	if is_block then
		vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
		print("󰅖 Cursor: I-Beam Mode")
	else
		vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
		print("󰛢 Cursor: BLOCK Mode")
	end
	is_block = not is_block
end, { desc = "Toggle Cursor Style" })

-- ─────────────────────────────────────
-- 📜 Quickfix Toggle (Terminal-safe key)
-- ─────────────────────────────────────
map("n", "<C-q>", function()
	if vim.fn.getqflist({ size = 0 }).size > 0 then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { noremap = true, silent = true, desc = "Toggle Quickfix List" })

-- ─────────────────────────────────────
-- 🔎 Select All with <C-a>
-- ─────────────────────────────────────
map("n", "<C-a>", "<cmd>normal! ggVG<CR>", { noremap = true, silent = true, desc = "Select All" })
map("i", "<C-a>", "<Esc><cmd>normal! ggVG<CR>", { noremap = true, silent = true, desc = "Select All from Insert Mode" })

-- ✅ Return empty table to mark the module loaded
return {}

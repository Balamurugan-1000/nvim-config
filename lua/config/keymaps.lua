vim.keymap.set("n", "<C-a>", function()
	vim.api.nvim_input("ggVG")
end, { desc = "Select entire buffer", noremap = true, silent = true })

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>;", ":lua Snacks.dashboard() <CR>", opts)
vim.keymap.set("n", "<C-a>", function()
	vim.cmd("normal! ggVG")
end, { desc = "Select entire buffer" })
map("n", "<leader>xh", ":nohlsearch<CR>", { desc = "Clear search highlights", noremap = true, silent = true })

-- map("n", "<C-w>", ":bd<CR>", { desc = "Close buffer", noremap = true, silent = true })

map("n", "<leader>c", '"+y', { desc = "Copy to Clipboard" })

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts) -- Add cursor in next line
map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts) -- Add cursor in previous line
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<leader><leader>", "<nop>", opts)

local is_block = true

vim.keymap.set("n", "<leader>cb", function()
	if is_block then
		vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
		print("󰅖 Cursor: I-Beam Mode")
	else
		vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
		print("󰛢 Cursor: BLOCK Mode")
	end
	is_block = not is_block
end, { desc = "Toggle Cursor Style" })

return {}

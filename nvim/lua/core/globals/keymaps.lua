local keymap = vim.keymap -- for conciseness

--disable arrow keys
keymap.set("", "<up>", "<nop>")
keymap.set("", "<down>", "<nop>")
keymap.set("", "<left>", "<nop>")
keymap.set("", "<right>", "<nop>")

keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")

-- move lines up and down
keymap.set("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
keymap.set("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })
keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = " Split horizontally" }) -- split window horizontally

-- save file
keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save current buffer" })

-- quit buffer
keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit vim" })

-- close current buffer
keymap.set("n", "<leader>x", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })

-- close all buffers except current buffer
keymap.set(
	"n",
	"<leader>bb",
	":%bd|e#|bd#<CR>",
	{ noremap = true, silent = true, desc = "Close all except current buffer" }
)

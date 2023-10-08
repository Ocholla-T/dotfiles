return {
	-- harpoon
	"ThePrimeagen/harpoon",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>ha", "<cmd>:lua require('harpoon.mark').add_file() <CR>", desc = "harpoon add file" },
		{ "<leader>hm", "<cmd>:lua require('harpoon.ui').toggle_quick_menu() <CR>", desc = "harpoon open menu" },
		{ "<leader>hn", "<cmd>:lua require('harpoon.ui').nav_next() <CR>", desc = "harpoon next" },
		{ "<leader>hb", "<cmd>:lua require('harpoon.ui').nav_prev() <CR>", desc = "harpoon prev" },
	},
}

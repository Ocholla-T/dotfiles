return {
	-- harpoon
	"ThePrimeagen/harpoon",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>ha", "<cmd>:lua require('harpoon.mark').add_file() <CR>", desc = "harpoon add file" },
		{ "<leader>hm", "<cmd>Telescope harpoon marks<CR>", desc = "harpoon open menu" },
		{ "<leader>hn", "<cmd>:lua require('harpoon.ui').nav_next() <CR>", desc = "harpoon next" },
		{ "<leader>hb", "<cmd>:lua require('harpoon.ui').nav_prev() <CR>", desc = "harpoon prev" },
	},
	opts = {
		-- set marks specific to each git branch inside git repository
		mark_branch = true,
	},
	config = function(_, opts)
		-- import harpoon plugin
		require("harpoon").setup(opts)

		-- open harpoon in telescope
		require("telescope").load_extension("harpoon")
	end,
}

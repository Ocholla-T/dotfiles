return {
	"ThePrimeagen/harpoon",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>ma", "<cmd>:lua require('harpoon.mark').add_file() <CR>", desc = "add file" },
		{ "<leader>mm", "<cmd>Telescope harpoon marks<CR>", desc = "open menu" },
		{ "<leader>mn", "<cmd>:lua require('harpoon.ui').nav_next() <CR>", desc = "next" },
		{ "<leader>mb", "<cmd>:lua require('harpoon.ui').nav_prev() <CR>", desc = "prev" },
	},
	opts = {
		global_settings = {
			-- set marks specific to each git branch inside git repository
			mark_branch = true,
		},
	},
	config = function(_, opts)
		-- import harpoon plugin
		require("harpoon").setup(opts)

		-- open harpoon in telescope
		require("telescope").load_extension("harpoon")
	end,
}

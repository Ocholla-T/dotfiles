return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = { char = "│" },
		exclude = {
			filetypes = {
				"help",
				"Trouble",
				"lazy",
				"mason",
				"notify",
			},
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}

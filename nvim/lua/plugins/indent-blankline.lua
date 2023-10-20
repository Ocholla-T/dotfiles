return {
	-- indent-blankline
	"lukas-reineke/indent-blankline.nvim",
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

return {
	-- indent-blankline
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		char = "│",
		filetype_exclude = {
			"help",
			"Trouble",
			"lazy",
			"mason",
			"notify",
		},
		show_trailing_blankline_indent = false,
		show_current_context = false,
	},
}

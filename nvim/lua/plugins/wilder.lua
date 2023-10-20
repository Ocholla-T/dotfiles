return {
	-- wilder
	"gelguy/wilder.nvim",
	event = "VeryLazy",
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" }, next_key = "<c-j>", previous_key = "<c-k>" })

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
				highlighter = wilder.basic_highlighter(),
				highlights = {
					border = "Normal",
				},
				border = "rounded",
			}))
		)

		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					language = "python",
					fuzzy = 1,
				}),
				wilder.python_search_pipeline({
					pattern = wilder.python_fuzzy_pattern(),
					sorter = wilder.python_difflib_sorter(),
					engine = "re",
				})
			),
		})
	end,
}

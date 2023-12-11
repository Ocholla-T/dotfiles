return {
	"norcalli/nvim-colorizer.lua",
	opts = {},
	config = function(_, opts)
		local colorizer = require("colorizer")

		colorizer.setup()
	end,
}

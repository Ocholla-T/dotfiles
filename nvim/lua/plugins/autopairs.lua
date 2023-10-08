return {
	-- autopairs
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		-- import nvim-autopairs
		local autopairs = require("nvim-autopairs")

		-- configure autopairs
		autopairs.setup({
			check_ts = true, -- enable treesitter
		})
	end,
	opts = {},
}

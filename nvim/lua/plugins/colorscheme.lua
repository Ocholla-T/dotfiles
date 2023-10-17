return {
	-- rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
			})

			vim.cmd("colorscheme rose-pine")
		end,
		lazy = false,
		priority = 10000,
	},
	--
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- config = function()
		-- 	vim.cmd("colorscheme catppuccin-mocha")
		-- end,
		lazy = false,
		priority = 1000,
	},
}

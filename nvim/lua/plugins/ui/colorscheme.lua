return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			dim_inactive = true, -- dims inactive windows
			style = "night",
			styles = {
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent",
			},
			transparent = true,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "macchiato",
			transparent_background = true,
			integrations = {
				harpoon = true,
				noice = true,
				navic = {
					enabled = true,
					custom_bg = "NONE",
				},
				which_key = true,
			},
		},
		-- config = function(_, opts)
		-- 	require("catppuccin").setup(opts)
		-- 	vim.cmd([[colorscheme catppuccin]])
		-- end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {
			disable_background = true,
			disable_float_background = true,
			variant = "moon",
		},
		-- config = function(_, opts)
		-- 	require("rose-pine").setup(opts)
		-- 	vim.cmd([[colorscheme rose-pine]])
		-- end,
	},
}

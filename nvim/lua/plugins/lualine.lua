return {
	-- statusline
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			component_separators = { left = "█", right = "█" },
			section_separators = { left = "█", right = "█" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				{
					"filename",
					filetype_names = {
						TelescopePrompt = "Telescope",
						dashboard = "Dashboard",
						packer = "Packer",
						fzf = "FZF",
						alpha = "Alpha",
					},
					symbols = {
						unnamed = "●", -- Text to show when the file is unnamed
						modified = "+", -- Text to show when the file is modified
						readonly = "", -- Text to show when the file is readonly
						newfile = "?", -- Text to show when it is a new file
					},
				},
			},
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { "#ff9e64" },
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		-- winbar = {
		-- 	lualine_c = {
		-- 		{
		-- 			"navic",
		-- 			color_correction = nil,
		-- 		},
		-- 	},
		-- },
	},
}

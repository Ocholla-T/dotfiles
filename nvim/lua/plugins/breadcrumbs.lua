return {
	"LunarVim/breadcrumbs.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		opts = {
			highlight = true,
			depth_limit = 0,
			depth_limit_indicator = "..",
			icons = {
				Text = " ",
				Method = " ",
				Function = " ",
				Constructor = " ",
				Field = " ",
				Variable = " ",
				Class = " ",
				Interface = " ",
				Module = " ",
				Property = " ",
				Unit = " ",
				Value = " ",
				Enum = " ",
				Keyword = " ",
				Snippet = " ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
			lazy_update_context = true,
			separator = " " .. "" .. " ",
			lsp = {
				auto_attach = true,
			},
		},
		config = function(_, opts)
			require("nvim-navic").setup(opts)
		end,
	},
	config = function()
		require("breadcrumbs").setup()
	end,
}

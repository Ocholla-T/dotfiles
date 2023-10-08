return {
	-- which-key helps you remember key bindings by showing a popup
	-- with the active keybindings of the command you started typing.
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "+goto" },
			["gz"] = { name = "+surround" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader>b"] = { name = "+buffer" },
			["<leader>c"] = { name = "+code" },
			["<leader>f"] = { name = "+file/find" },
			["<leader>g"] = { name = "+git" },
			["<leader>gh"] = { name = "+hunks" },
			["<leader>h"] = { name = "+marks" },
			["<leader>l"] = { name = "+lsp" },
			["<leader>q"] = { name = "+quit/session" },
			["<leader>s"] = { name = "+split" },
			["<leader>p"] = { name = "+persistence" },
			["<leader>w"] = { name = "+save/session" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}

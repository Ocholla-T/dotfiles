return {
	-- persistence
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	config = function()
		local persistence = require("persistence")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		-- restore the session for the current directory
		opts.desc = "restore session for current directory"
		keymap.set("n", "<leader>pc", [[<cmd>lua require("persistence").load()<cr>]], opts)

		-- restore the last session
		opts.desc = "restore last session"
		keymap.set("n", "<leader>pS", [[<cmd>lua require("persistence").load({ last = true })<cr>]], opts)

		-- stop Persistence => session won't be saved on exit
		opts.desc = "stop"
		keymap.set("n", "<leader>pd", [[<cmd>lua require("persistence").stop()<cr>]], opts)

		persistence.setup({})
	end,
	opts = {
		-- add any custom options here
	},
}

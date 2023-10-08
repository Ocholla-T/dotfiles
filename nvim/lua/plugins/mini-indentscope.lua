return {
	-- Active indent guide and indent text objects. When you're browsing
	-- code, this highlights the current level of indentation, and animates
	-- the highlighting.
	"echasnovski/mini.indentscope",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- symbol = "▏",
		symbol = "│",
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"Trouble",
				"lazy",
				"mason",
				"notify",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}

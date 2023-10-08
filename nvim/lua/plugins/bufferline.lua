return {
	-- bufferline
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		---@diagnostic disable-next-line: missing-fields
		bufferline.setup({
			---@diagnostic disable-next-line: missing-fields
			options = {
				diagnostics = "nvim_lsp",
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				show_close_icon = false,
				show_buffer_close_icons = false,
				view = "default",
				modified_icon = "•",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				persist_buffer_sort = true,
				separator_style = { "", "" },
				enforce_regular_tabs = false,
				always_show_bufferline = true,
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Go To Next Buffer" })
		keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go To Previous Buffer" })
	end,
}
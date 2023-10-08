return {
	-- telescope
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- improve fuzzzy finding
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- select menu
		{ "nvim-telescope/telescope-ui-select.nvim" },
		-- file browser
		{ "nvim-telescope/telescope-file-browser.nvim" },
		-- undo tree
		{ "debugloop/telescope-undo.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				hidden = false,
				color_devicons = true,
				mappings = {
					i = {
						["<C-j>"] = {
							actions.move_selection_next,
							type = "action",
							opts = { nowait = true, silent = true },
						},
						["<C-k>"] = {
							actions.move_selection_previous,
							type = "action",
							opts = { nowait = true, silent = true },
						},
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				["file_browser"] = {
					hijack_netrw = true,
					hidden = true,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("ui-select")
		telescope.load_extension("undo")
	end,
	keys = {
		{ "<leader>fb", "<cmd>:lua require('telescope.builtin').buffers()<CR>", desc = "Find buffers" },
		{
			"<leader>fe",
			"<cmd>:Telescope file_browser path=%:p:h select_buffer=true<CR>",
			desc = "Open file explorer",
		},
		{ "<leader>ff", "<cmd>:lua require('telescope.builtin').find_files()<CR>", desc = "Find files" },
		{ "<leader>fw", "<cmd>:lua require('telescope.builtin').live_grep()<CR>", desc = "Find word" },
		{ "<leader>fh", "<cmd>:lua require('telescope.builtin').help_tags()<CR>", desc = "Find help" },
		{ "<leader>fa", "<cmd>:lua require('telescope.builtin').man_pages()<CR>", desc = "Find manual" },
		{
			"<leader>fs",
			"<cmd>Telescope lsp_document_symbols<CR>",
			desc = "Find document symbols",
		},
		{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Find undo" },
	},
}

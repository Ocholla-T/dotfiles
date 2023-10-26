return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			local wk = require("which-key")

			wk.register({
				-- telescope keybindings
				["<leader>f"] = { name = "+find/files" },
				["<leader>fh"] = { builtin.help_tags, "help" },
				["<leader>fw"] = { builtin.live_grep, "words" },
				["<leader>fb"] = { builtin.buffers, "buffers" },
				["<leader>fa"] = { builtin.man_pages, "manual" },
				["<leader>ff"] = { builtin.find_files, "files" },
				["<leader>fs"] = { "<cmd>Telescope lsp_document_symbols<CR>", "document symbols" },
			})

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = {
								require("telescope.actions").move_selection_next,
								type = "action",
								opts = { nowait = true, silent = true },
							},
							["<C-k>"] = {
								require("telescope.actions").move_selection_previous,
								type = "action",
								opts = { nowait = true, silent = true },
							},
							["<esc>"] = require("telescope.actions").close,
							["<C-h>"] = "which_key",
						},
					},
				},
			})
		end,
	},

	-- telescope-file-browser
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						hijack_netrw = true,
					},
				},
			})

			require("telescope").load_extension("file_browser")

			local wk = require("which-key")

			wk.register({
				["<leader>fe"] = {
					"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
					"open file browser",
				},
			})
		end,
	},

	-- telescope-ui-select
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},

	-- telescope-fzf-native
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},

	-- telescope-undo
	{
		"debugloop/telescope-undo.nvim",
		config = function()
			require("telescope").load_extension("undo")

			local wk = require("which-key")

			wk.register({
				["<leader>fu"] = { "<cmd>Telescope undo<CR>", "open undo tree" },
			})
		end,
	},
}

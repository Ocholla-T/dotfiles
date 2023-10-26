return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "┃" },
			untracked = { text = "┆" },
		},
		numhl = false,
		current_line_blame = true,
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local wk = require("which-key")

			-- Navigation
			wk.register({
				["]c"] = {
					function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end,
					"next hunk",
				},
				["[c"] = {
					function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end,
					"previous hunk",
				},
			}, { expr = true })

			-- Actions
			wk.register({
				["<leader>h"] = { name = "+gitsigns" },
				["<leader>hs"] = { gs.stage_hunk, "stage hunk" },
				["<leader>hr"] = { gs.reset_hunk, "reset hunk" },
				["<leader>hp"] = { gs.preview_hunk, "preview hunk" },
				["<leader>hu"] = { gs.undo_stage_hunk, "undo stage hunk" },
				["<leader>hS"] = { gs.stage_buffer, "stage buffer" },
				["<leader>hR"] = { gs.reset_buffer, "reset buffer" },
				["<leader>hb"] = {
					function()
						gs.blame_line({ full = true })
					end,
					"blame line",
				},
				["<leader>htb"] = { gs.toggle_current_line_blame, "toggle current line blame" },
				["<leader>hd"] = { gs.diffthis, "diff this" },
				["<leader>hD"] = {
					function()
						gs.diffthis("~")
					end,
					"diff this ~",
				},
				["<leader>htd"] = { gs.toggle_deleted, "toggle deleted" },
			}, { buffer = bufnr })

			-- Text object
			wk.register({
				["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "gitsigns select hunk" },
			}, {
				mode = "o",
			})

			wk.register({
				["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "gitsigns select hunk" },
			}, {
				mode = "x",
			})
		end,
	},
}

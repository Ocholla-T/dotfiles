return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                     ]],
			[[                                                                     ]],
			[[  ██████╗  ██████╗██╗  ██╗ ██████╗ ██╗     ██╗      █████╗ ████████╗ ]],
			[[ ██╔═══██╗██╔════╝██║  ██║██╔═══██╗██║     ██║     ██╔══██╗╚══██╔══╝ ]],
			[[ ██║   ██║██║     ███████║██║   ██║██║     ██║     ███████║   ██║    ]],
			[[ ██║   ██║██║     ██╔══██║██║   ██║██║     ██║     ██╔══██║   ██║    ]],
			[[ ╚██████╔╝╚██████╗██║  ██║╚██████╔╝███████╗███████╗██║  ██║   ██║    ]],
			[[  ╚═════╝  ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ]],
			[[                                                                     ]],
			[[                           N E O V I M                               ]],
			[[                                                                     ]],
			[[                              /\_/\                                  ]],
			[[---------------------------- ( o.o ) --------------------------------]],
			[[                              > ^ <                                  ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button(
				"leader fe",
				"  Open file explorer",
				":Telescope file_browser path=%:p:h select_buffer=true<CR>"
			),
			dashboard.button("leader ff", "  Find files", ":lua require('telescope.builtin').find_files()<CR>"),
			dashboard.button("leader fh", "?  Find help", ":lua require('telescope.builtin').help_tags()<CR>"),
			dashboard.button("leader fw", "󰈭  Find word", ":lua require('telescope.builtin').live_grep()<CR>"),
			dashboard.button("leader q ", "󰿅  Quit NVIM", ":qa<CR>"),
		}

		-- It uses almost the same format as the "date" command in Linux (man date for info)
		local time = os.date("%_k:%M - %a - %b %d")
		local lazy = require("lazy")
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					lazy.show()
				end,
			})
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = lazy.stats()
				local v = vim.version()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = {
					"",
					"                         " .. time,
					"",
					"                            Neovim " .. v.major .. "." .. v.minor .. "." .. v.patch,
					"",
					"                 "
						.. stats.loaded
						.. " / "
						.. stats.count
						.. " plugins | "
						.. ms
						.. "ms |  Ocholla-T",
					"",
					" 󰽰 You think darkness is your ally. But you merely adopted the dark. 󰽰",
					"               󰎈 I was born in it. Formed by it 󰎈",
					"",
					"",
					"",
				}
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		alpha.setup(dashboard.config)
    end
}

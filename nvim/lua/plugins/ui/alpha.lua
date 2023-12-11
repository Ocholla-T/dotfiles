return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                     ]],
			[[                                                                     ]],
			[[                                                                     ]],
			[[                                                                     ]],
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

		alpha.setup(dashboard.config)
	end,
}

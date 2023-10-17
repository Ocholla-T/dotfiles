return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	opts = function()
		local jdtls_ok, jdtls = pcall(require, "jdtls")
		if not jdtls_ok then
			vim.notify("JDTLS not found, install with `:LspInstall jdtls`")
			return
		end

		local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
		local root_dir = require("jdtls.setup").find_root(root_markers)

		local HOME = os.getenv("HOME")

		-- calculate workspace dir
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

		-- get the mason install path
		local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

		-- get the current OS
		local os
		if vim.fn.has("macunix") then
			os = "mac"
		elseif vim.fn.has("win32") then
			os = "win"
		else
			os = "linux"
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local extendedClientCapabilities = jdtls.extendedClientCapabilities
		extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

		local keymap = vim.keymap -- for conciseness

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show help for what is under cursor"
			keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts) -- show help for what is under cursor

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		return {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-javaagent:" .. install_path .. "/lombok.jar",
				"-Xms1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
				"-configuration",
				install_path .. "/config_" .. os,
				"-data",
				workspace_dir,
			},
			root_dir = root_dir,
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				bundles = {},
			},
			settings = {
				java = {
					codeGeneration = {
						toString = {
							template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
						},
						useBlocks = true,
					},
					completion = {
						favoriteStaticMembers = {
							"org.hamcrest.MatcherAssert.assertThat",
							"org.hamcrest.Matchers.*",
							"org.hamcrest.CoreMatchers.*",
							"org.junit.jupiter.api.Assertions.*",
							"java.util.Objects.requireNonNull",
							"java.util.Objects.requireNonNullElse",
							"org.mockito.Mockito.*",
						},
					},
					configuration = {
						updateBuildConfiguration = "interactive",
					},
					contentProvider = { preferred = "fernflower" },
					eclipse = {
						downloadSources = true,
					},
					extendedClientCapabilities = extendedClientCapabilities,
					flags = {
						allow_incremental_sync = true,
					},
					format = {
						settings = {
							url = HOME .. "/dotfiles/nvim/formatter-utils/intellij-java-google-style.xml",
						},
					},
					maven = {
						downloadSources = true,
					},
					implementationsCodeLens = {
						enabled = true,
					},
					-- Language server `initializationOptions`
					-- You need to extend the `bundles` with paths to jar files
					-- if you want to use additional eclipse.jdt.ls plugins.
					--
					-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
					--
					-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
					init_options = {
						bundles = {},
					},
					inlayHints = {
						parameterNames = {
							enabled = "all", -- literals, all, none
						},
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					signatureHelp = { enabled = true },
					sources = {
						organizeImports = {
							starThreshold = 9999,
							staticStarThreshold = 9999,
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		vim.api.nvim_create_autocmd("Filetype", {
			pattern = "java", -- autocmd to start jdtls
			callback = function()
				if opts.root_dir and opts.root_dir ~= "" then
					require("jdtls").start_or_attach(opts)
				end
			end,
		})

		local status_ok, which_key = pcall(require, "which-key")
		if not status_ok then
			return
		end

		local wkopts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		local vopts = {
			mode = "v", -- VISUAL mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		local mappings = {
			c = {
				o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
				v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
				c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
				t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
				T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
				u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
			},
		}

		local vmappings = {
			c = {
				v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
				c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
				m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
			},
		}

		which_key.register(mappings, wkopts)
		which_key.register(vmappings, vopts)
	end,
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"jose-elias-alvarez/typescript.nvim",
		"mfussenegger/nvim-jdtls",
	},
	config = function()
		-- import neoconf plugin
		require("neoconf").setup({})

		-- import neodev plugin
		require("neodev").setup({})

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

			-- typescript
			opts.desc = "Typescript organize imports"
			keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", opts) -- organize imports

			opts.desc = "Typescript add missing imports"
			keymap.set("n", "<leader>cm", "<cmd>TypescriptAddMissingImports<CR>", opts) -- add missing imports

			opts.desc = "Typescript fix all"
			keymap.set("n", "<leader>cf", "<cmd>TypescriptFixAll<CR>", opts) -- typescript fix all

			opts.desc = "Typescript remove unused"
			keymap.set("n", "<leader>cru", "<cmd>TypescriptRemoveUnused<CR>", opts) -- typescript remove unused

			opts.desc = "Typescript rename file"
			keymap.set("n", "<leader>crn", "<cmd>TypescriptRenameFile<CR>", opts) -- typescript rename file
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local function get_node_modules(root_dir)
			-- return util.find_node_modules_ancestor(root_dir) .. '/node_modules' or ''
			-- util.find_node_modules_ancestor()
			local root_node = root_dir .. "/node_modules"
			local stats = vim.loop.fs_stat(root_node)
			if stats == nil then
				return ""
			else
				return root_node
			end
		end

		local default_node_modules = get_node_modules(vim.fn.getcwd())

		mason_lspconfig.setup({
			ensure_installed = {
				"angularls",
				"bashls",
				"cssls",
				"html",
				"emmet_ls",
				"jdtls",
				"lua_ls",
				"phpactor",
				"sqlls",
				"tailwindcss",
				"tsserver",
				"volar",
				"yamlls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
			handlers = {
				function(server_name) -- default handler (optional)
					lspconfig[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				-- configure emmet language server
				["emmet_ls"] = function()
					lspconfig["emmet_ls"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,
				-- configure graphql language server
				["graphql"] = function()
					lspconfig["graphql"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				end,
				-- configure graphql language server
				["jdtls"] = function()
					return true
				end,
				-- configure jsonls
				["jsonls"] = function()
					lspconfig["jsonls"].setup({
						cmd = { "vscode-json-language-server", "--stdio" },
						filetypes = { "json", "jsonc" },
						settings = {
							json = {
								-- Schemas https://www.schemastore.org
								schemas = {
									{
										fileMatch = { "package.json" },
										url = "https://json.schemastore.org/package.json",
									},
									{
										fileMatch = { "manifest.json", "manifest.webmanifest" },
										url = "https://json.schemastore.org/web-manifest-combined.json",
									},
									{
										fileMatch = { "tsconfig*.json" },
										url = "https://json.schemastore.org/tsconfig.json",
									},
									{
										fileMatch = {
											".prettierrc",
											".prettierrc.json",
											"prettier.config.json",
										},
										url = "https://json.schemastore.org/prettierrc.json",
									},
									{
										fileMatch = { ".eslintrc", ".eslintrc.json" },
										url = "https://json.schemastore.org/eslintrc.json",
									},
									{
										fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
										url = "https://json.schemastore.org/babelrc.json",
									},
									{
										fileMatch = { "lerna.json" },
										url = "https://json.schemastore.org/lerna.json",
									},
									{
										fileMatch = { "now.json", "vercel.json" },
										url = "https://json.schemastore.org/now.json",
									},
									{
										fileMatch = {
											".stylelintrc",
											".stylelintrc.json",
											"stylelint.config.json",
										},
										url = "http://json.schemastore.org/stylelintrc.json",
									},
								},
							},
						},
					})
				end,
				-- configure lua language server
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						settings = { -- custom settings for lua
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = { globals = { "vim" } },
								workspace = {
									-- make language server aware of runtime files
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
				["tsserver"] = function(_, opts)
					require("typescript").setup({ server = opts })
					return true
				end,
				-- configure vue language server
				["volar"] = function()
					lspconfig["volar"].setup({
						init_options = {
							typescript = {
								tsdk = default_node_modules .. "/typescript/lib",
							},
						},
					})
				end,
			},
		})
	end,
}

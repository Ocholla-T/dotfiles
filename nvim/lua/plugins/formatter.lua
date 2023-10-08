return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import conform
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				lua = { "stylua" },
				markdown = { { "prettierd", "prettier" } },
				php = { "php_cs_fixer" },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				async = false,
				timeout_ms = 5000,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				async = false,
				timeout_ms = 5000,
				lsp_fallback = true,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

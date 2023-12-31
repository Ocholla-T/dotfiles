return {
	"mfussenegger/nvim-lint",
	event = { "BufNewFile", "BufReadPre" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- javascript = { "eslint_d" },
			-- typescript = { "eslint_d" },
			-- javascriptreact = { "eslint_d" },
			-- typescriptreact = { "eslint_d" },
			sql = { "sqlfluff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		local wk = require("which-key")

		wk.register({
			["<leader>cl"] = {
				function()
					lint.try_lint()
				end,
				"trigger linting for current file",
			},
		})
	end,
}

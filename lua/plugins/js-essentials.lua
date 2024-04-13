return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d", "quick-lint-js" },
				javascriptreact = { "eslint_d", "quick-lint-js" },
				typescript = { "eslint_d", "quick-lint-js" },
				typescriptreact = { "eslint_d", "quick-lint-js" },
				json = { "jsonlint" },
				dotenv = { "dotenv-linter" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			--[[ vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			}) ]]

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>ll", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { { "prettierd", "prettier" } },
					javascriptreact = { { "prettierd", "prettier" } },
					typescript = { { "prettierd", "prettier" } },
					typescriptreact = { { "prettierd", "prettier" } },
					css = { "prettierd" },
					html = { "prettierd" },
					json = { "prettierd" },
					lua = { "stylua" },
					yaml = { "prettierd" },
				},

				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			vim.keymap.set("n", "<leader>fm", function()
				conform.format()
			end, {})
		end,
	},
}

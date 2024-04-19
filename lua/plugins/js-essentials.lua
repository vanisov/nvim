return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-shellcheck.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					require("none-ls.diagnostics.eslint_d"),
					require("none-ls.code_actions.eslint_d"),
					require("none-ls-shellcheck.diagnostics"),
					require("none-ls-shellcheck.code_actions"),
				},
			})
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
				conform.format({ timeout_ms = 2000 })
			end, {})
		end,
	},
}

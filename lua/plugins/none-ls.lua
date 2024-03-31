return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.code_actions.eslint_d"),
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
			},
		})

		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ timeout_ms = 50000 })
		end, {})
	end,
}

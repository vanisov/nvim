return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle()
			end)
			vim.keymap.set("n", "<leader>tw", function()
				require("trouble").toggle("workspace_diagnostics")
			end)
			vim.keymap.set("n", "<leader>td", function()
				require("trouble").toggle("document_diagnostics")
			end)
			vim.keymap.set("n", "<leader>tq", function()
				require("trouble").toggle("quickfix")
			end)
			vim.keymap.set("n", "<leader>tl", function()
				require("trouble").toggle("loclist")
			end)
			vim.keymap.set("n", "<leader>tr", function()
				require("trouble").toggle("lsp_references")
			end)
		end,
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		config = function()
			require("ts-error-translator").setup()
		end,
	},
	{
		"chikko80/error-lens.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		opts = {},
	},
}

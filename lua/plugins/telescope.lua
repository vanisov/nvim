return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local keymap = vim.keymap.set

			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
				},
			})

			-- File Pickers
			keymap("n", "<c-p>", builtin.find_files, {})
			keymap("n", "<leader>ff", builtin.find_files, {})
			keymap("n", "<leader>gf", builtin.git_files, {})
			keymap("n", "<leader>fg", builtin.live_grep, {})

			-- Vim Pickers
			keymap("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
			keymap("n", "<leader>fb", builtin.buffers, {})
			keymap("n", "<leader>qf", builtin.quickfix, {})
			keymap("n", "<leader>th", builtin.colorscheme, {})

			-- Git
			keymap("n", "<leader>gb", builtin.git_branches, {})
			keymap("n", "<leader>gs", builtin.git_status, {})

			-- LSP Pickers
			keymap("n", "<leader>fr", builtin.lsp_references, {})
			keymap("n", "gd", builtin.lsp_definitions, {})
			keymap("n", "<leader>ft", builtin.lsp_type_definitions, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

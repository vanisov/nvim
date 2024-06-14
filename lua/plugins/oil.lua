return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")

		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
			float = {
				padding = 5,
			},
			win_options = {
				wrap = true,
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<C-n>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
}

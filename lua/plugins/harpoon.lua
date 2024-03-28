return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-h>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>k", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():next()
		end)
	end,
}

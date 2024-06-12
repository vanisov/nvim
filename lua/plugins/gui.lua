return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({})
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = { "BufEnter" },
		config = function()
			require("fidget").setup({
				text = {
					spinner = "dots_negative",
				},
				window = {
					blend = 0,
				},
			})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	{
		"eoh-bse/minintro.nvim",
		config = true,
		lazy = false,
		opts = {
			color = "#ea9a97",
		},
	},
}

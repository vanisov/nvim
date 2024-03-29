return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "horizon",
        section_separators = { left = '', right = ''},
			},
			extensions = { "oil" },
		})
	end,
}

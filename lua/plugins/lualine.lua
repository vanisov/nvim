return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "modus-vivendi",
        section_separators = { left = '', right = ''},
			},
			extensions = { "oil" },
		})
	end,
}

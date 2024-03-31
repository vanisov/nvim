return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("nvim-autopairs").setup()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"roobert/tailwindcss-colorizer-cmp.nvim",
				config = true,
			},
		},
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				formatting = {
					format = require("tailwindcss-colorizer-cmp").formatter,
					fields = { "menu", "abbr", "kind" },
					expandable_indicator = true,
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-f>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.close_docs(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}

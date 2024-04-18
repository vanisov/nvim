return {
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.2",
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"windwp/nvim-ts-autotag",
			"windwp/nvim-autopairs",
			{
				"roobert/tailwindcss-colorizer-cmp.nvim",
				config = true,
			},
		},
		config = function()
			local cmp = require("cmp")
			local cmpautopairs = require("nvim-autopairs.completion.cmp")
			local luasnip = require("luasnip")
			local luasnip_loaders = require("luasnip.loaders.from_vscode")
			local nvim_autoairs = require("nvim-autopairs")
			local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")

			luasnip_loaders.lazy_load()
			nvim_autoairs.setup()

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", cmpautopairs.on_confirm_done())

			cmp.setup({
				formatting = {
					format = tailwindcss_colorizer_cmp.formatter,
					fields = { "menu", "abbr", "kind" },
					expandable_indicator = true,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = {
					{ name = "nvim_lsp" }, -- prioritize LSP completion
					{ name = "luasnip" },
					{ name = "buffer", max_item_count = 5 },
				},
			})
		end,
	},
}

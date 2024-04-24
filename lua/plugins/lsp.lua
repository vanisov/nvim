return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost" },
		lazy = false,
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"folke/lsp-colors.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		opts = {
			inlay_hints = {
				enabled = true,
			},
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local icons = require("config.icons")
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local mason_tool_installer = require("mason-tool-installer")

			-- Use mason for managing LSP's
			mason.setup({
				PATH = "prepend",

				ui = {
					border = "rounded",
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"emmet_language_server",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"prettierd",
					"stylua",
					"eslint_d",
					"eslint_d",
				},
			})

			local signs = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
			}
			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
			end

			vim.diagnostic.config({
				virtual_text = { prefix = icons.ui.VirtualPrefix },
				signs = {
					active = signs,
				},
				float = {
					focusable = true,
					style = "minimal",
					border = "single",
					header = "",
				},
			})

			-- CMP Autocompletion stuff
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.astro.setup({
				capabilities = capabilities,
				filetypes = { "astro" },
			})

			--[[ lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
        filetypes = {
          "html",
          "css",
          "sass",
          "scss",
          "javascript",
          "javascriptreact",
          "typescriptreact",
        },
        showSuggestionsAsSnippets = true,
      }) ]]

			--[[ lspconfig.emmet_ls.setup({
        capabilities = capabilities,
      }) ]]

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
		end,
	},
	{
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup({
				Error = "#db4b4b",
				Warning = "#e0af68",
				Information = "#0db9d7",
				Hint = "#10B981",
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "",
				},
				lightbulb = {
					enable = false,
				},
			})

			local signs = {
				Error = " ",
				Warning = " ",
				Warn = " ",
				Hint = " ",
				Information = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
}

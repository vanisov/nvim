return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    lazy = false,
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
      -- Plugin & UI for LSP's
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Better nvim config for LSP
      "folke/neodev.nvim",

      -- Completion
      "hrsh7th/nvim-cmp",
    },
    config = function()
      -- Setup neodev
      require("neodev").setup()

      -- Use mason for managing LSP's
      require("mason").setup({
        PATH = "prepend",

        ui = {
          border = "rounded",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "emmet_language_server",
          "eslint",
        },
      })

      -- CMP Autocompletion stuff
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local lspconfig = require("lspconfig")
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

      lspconfig.emmet_language_server.setup({
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
      })

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

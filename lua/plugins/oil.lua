return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 8,
      }
    })

    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<C-n>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
  end,
}

return {
  "filipdutescu/renamer.nvim",
  branch = "master",
  requires = {
    { "nvim-lua/plenary.nvim" },
  },
  opts = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>rn",
      '<cmd>lua require("renamer").rename()<cr>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "v",
      "<leader>rn",
      '<cmd>lua require("renamer").rename()<cr>',
      { noremap = true, silent = true }
    )
  end,
}

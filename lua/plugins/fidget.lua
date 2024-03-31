return {
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
}

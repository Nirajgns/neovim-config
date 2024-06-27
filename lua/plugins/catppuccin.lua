return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      color_overrides = {
        mocha = { base = "#11111b", mantle = "#12121c", crust = "#19191f" },
      },
    })
  end,
}

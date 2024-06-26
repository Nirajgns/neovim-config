return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      color_overrides = {
        all = {
          text = "#ffffff",
        },
        latte = {
          base = "#ff0000",
          mantle = "#242424",
          crust = "#474747",
        },
        frappe = {},
        macchiato = {},
        mocha = { base = "#11111b", mantle = "#11111b" },
      },
    })
  end,
}

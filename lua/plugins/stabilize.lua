return {
  "luukvbaal/stabilize.nvim",
  lazy = true,
  event = "UIEnter",
  config = function()
    require("stabilize").setup()
  end,
}

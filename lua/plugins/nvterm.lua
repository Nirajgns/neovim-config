return {

  "NvChad/nvterm",
  lazy = true,
  event = "UIEnter",
  config = function()
    require("nvterm").setup({
      terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
          float = {
            relative = "editor",
            row = 0.08,
            col = 0.045,
            width = 0.9,
            height = 0.8,
            border = "single",
          },
          horizontal = { location = "rightbelow", split_ratio = 0.35 },
          vertical = { location = "rightbelow", split_ratio = 0.4 },
        },
      },
    })
  end,
}

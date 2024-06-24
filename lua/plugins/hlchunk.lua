return {
  "shellRaining/hlchunk.nvim",
  event = "InsertEnter",
  config = function()
    require("hlchunk").setup({
      chunk = { enable = true },
      blank = {
        enable = false,
      },
      line_num = { enable = false },
      indent = { enable = false },
    })
  end,
}

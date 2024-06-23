return {
  "nvim-neo-tree/neo-tree.nvim",

  config = function()
    require("neo-tree").setup({
      popup_border_style = "rounded",
      default_component_configs = {
        indent = {
          last_indent_marker = "╰-",
        },
      },
      window = {
        width = 30,
      },
    })
  end,
}

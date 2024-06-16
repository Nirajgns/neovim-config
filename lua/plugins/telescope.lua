return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
      sorting_strategy = "ascending",
      --- other configs
    },
  },
}

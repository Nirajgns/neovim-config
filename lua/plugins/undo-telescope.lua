return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  keys = "<leader>uu",
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = {
            preview_width = 0.5,
            prompt_position = "top",
          },
        },
        sorting_strategy = "ascending",
      },
      extensions = {
        undo = {},
      },
    })
    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>uu", "<cmd>Telescope undo<cr>")
  end,
}

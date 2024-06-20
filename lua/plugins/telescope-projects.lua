return {
  "nvim-telescope/telescope-project.nvim",
  vim.keymap.set(
    "n",
    "<leader>p",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true, desc = "find projects with telescope" }
  ),
}

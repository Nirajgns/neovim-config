return {
  "nvim-telescope/telescope-project.nvim",
  config = function()
    require("telescope").setup({
      extensions = {
        project = {
          theme = "dropdown",
          on_project_selected = function(prompt_bufnr)
            -- Do anything you want in here. For example:
            local project_actions = require("telescope._extensions.project.actions")
            project_actions.change_working_directory(prompt_bufnr, false)
            require("persistence").load()
            require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
            vim.cmd("Neotree close")
            vim.cmd("Neotree show")
          end,
        },
      },
    })
  end,
  vim.keymap.set(
    "n",
    "<leader>p",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true, desc = "find projects with telescope" }
  ),
}

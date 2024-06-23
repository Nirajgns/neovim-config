return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "<c-k>", mode = "i", false }
    -- change a keymap
    keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "hover doc", silent = true }

    keys[#keys + 1] = { "gr", "<cmd>Lspsaga finder<cr>", desc = "references (finder)", silent = true }

    keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "go to definition", silent = true }

    keys[#keys + 1] = { "gpd", "<cmd>Lspsaga peek_definition<cr>", desc = "peek definition", silent = true }

    keys[#keys + 1] = { "gpy", "<cmd>Lspsaga peek_type_definition<cr>", desc = "peek type definition", silent = true }

    keys[#keys + 1] = { "gy", "<cmd>Lspsaga goto_type_definition<cr>", desc = "go to type definition", silent = true }

    keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "code actions", silent = true }

    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
  end,
}

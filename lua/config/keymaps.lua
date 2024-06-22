-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local wk = require("which-key")

--jk to esc in insert mode
map("i", "jk", "<ESC>")

-- Insert mode mappings
map("i", "<A-h>", "<Left>", { noremap = true, silent = true })
map("i", "<A-j>", "<Down>", { noremap = true, silent = true })
map("i", "<A-k>", "<Up>", { noremap = true, silent = true })
map("i", "<A-l>", "<Right>", { noremap = true, silent = true })

-- Command mode mappings
map("c", "<C-h>", "<Left>", { noremap = true, silent = false })
map("c", "<C-j>", "<Down>", { noremap = true, silent = false })
map("c", "<C-k>", "<Up>", { noremap = true, silent = false })
map("c", "<C-l>", "<Right>", { noremap = true, silent = false })

---switch buffers with TAB key
map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

--flutter tools
map("n", "<leader>ft", ":Telescope flutter commands<cr>", { silent = true, desc = "telescope flutter tools" })

--nvterm toggles
map(
  { "n", "t" },
  "<A-v>",
  '<cmd>lua require("nvterm.terminal").toggle("vertical")<CR>',
  { noremap = true, silent = true, desc = "vertical terminal toggle" }
)

map(
  { "n", "t" },
  "<A-i>",
  '<cmd>lua require("nvterm.terminal").toggle("float")<CR>',
  { noremap = true, silent = true, desc = "floating terminal toggle" }
)
map(
  { "n", "t" },
  "<A-h>",
  '<cmd>lua require("nvterm.terminal").toggle("horizontal")<CR>',
  { noremap = true, silent = true, desc = "horizontal terminal toggle" }
)
------------------------toggle lspsaga terminal--------------
map({ "n" }, "<A-t>", ":Lspsaga term_toggle<cr>", { silent = true, desc = "toggle lspsaga floating terminal" })

map(
  { "t" },
  "<A-t>",
  "<C-\\><C-n>:Lspsaga term_toggle<CR>",
  { silent = true, desc = "toggle lspsaga floating terminal" }
)
----------------lspsaga-------------
wk.register({
  l = {
    name = "Lspsaga",
    c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    o = { "<cmd>Lspsaga outline<cr>", "Outline" },
    R = { "<cmd>Lspsaga rename<cr>", "Rename with lsp" },
    d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
    r = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Preview Definition" },
    s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
    w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
    i = { "<cmd>LspInfo<cr>", "Lsp info and status" },
  },
}, { prefix = "<leader>" })

--======================Spectre Search====================-
wk.register({
  s = {
    name = "spectre",
    t = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre" },
    p = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search and replace on project" },
    f = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file" },

    r = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search and replace on project" },
  },
}, { prefix = "<leader>" })

wk.register({
  s = {
    w = { '<esc><cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word" },
  },
}, { mode = "v", prefix = "<leader>" })

---=======================for easy typing--------------------------

map("i", "<C-BS>", "<C-w>", { noremap = true, silent = true, desc = "delete word with ctrl+bcspc" })

map(
  "n",
  "<leader>uH",
  ":lua lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())<cr>",
  { desc = "global lsp inlay hints" }
)

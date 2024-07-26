-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local wk = require("which-key")

--jk to exit insert and terminal mode
map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

map("t", "<esc>", "<C-\\><C-n>", { noremap = true, silent = true })
-- Insert mode mappings to move the cursor
map("i", "<C-h>", "<Left>", { noremap = true, silent = true })
map("i", "<C-j>", "<Down>", { noremap = true, silent = true })
map("i", "<C-k>", "<Up>", { noremap = true, silent = true })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true })

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

--terminal toggles
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

map({ "n", "t" }, "<A-t>", "<cmd>Lspsaga term_toggle<cr>", { silent = true, desc = "toggle lspsaga floating terminal" })

----------------lspsaga-------------
wk.add({
  { "<leader>l", group = "Lspsaga" },
  { "<leader>lR", "<cmd>Lspsaga rename<cr>", desc = "Rename with lsp" },
  { "<leader>lc", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
  { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "Lsp GoTo Definition" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp info and status" },
  { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
  { "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", desc = "Preview Definition" },
  { "<leader>lr", "<cmd>Lspsaga finder<cr>", desc = "Lsp Finder" },
  { "<leader>ls", "<cmd>Lspsaga signature_help<cr>", desc = "Signature Help" },
  { "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Show Workspace Diagnostics" },
})
--===================Search & Replace====================-
wk.add({
  {
    "<leader>sf",
    '<cmd>lua require("grug-far").grug_far({ prefills = { flags = vim.fn.expand("%") , search = vim.fn.expand("<cword>") } })<CR>',
    desc = "Search on current file",
  },
  {
    "<leader>sp",
    '<cmd>lua require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })<CR>',
    desc = "Search and replace on project",
  },
}, { prefix = "<leader>" })

wk.add({
  {
    "<leader>sw",
    '<cmd>lua require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })<CR>',
    desc = "Search current word",
    mode = "v",
  },
}, { mode = "v", prefix = "<leader>" })

---marks with telescope---
map("n", "<leader>'", "<cmd>Telescope marks<cr>", { noremap = true, silent = true, desc = "marks with telescope" })

---=======================for easy typing--------------------------
map({ "i", "t" }, "<C-BS>", "<C-w>", { noremap = true, silent = true, desc = "delete word with ctrl+bcspc" })

---docs in side---
map({ "n" }, "<C-S-k>", "<cmd>DocsViewToggle<cr>", { noremap = true, silent = true, desc = "docs in the side" })
map({ "n" }, "<C-S-s>", "<cmd>wa<cr>", { noremap = true, silent = true, desc = "save all" })

-----------copy and paste--------------
map("v", "<C-c>", '"+y', { silent = true, desc = "copy in visual mode" })

map("c", "<C-v>", "<C-r>+", { noremap = true, desc = "paste in command mode" })
map("n", "<C-S-v>", '"+P', { silent = true, desc = "paste in normal mode" })
map("v", "<C-S-v>", '"+P', { silent = true, desc = "paste in visual mode" })
map("i", "<C-v>", "<C-R>+", { silent = true, desc = "paste in insert mode" })

--Dashboard
map("n", "<leader>qb", ":Dashboard<cr>", { silent = true, desc = "Dashboard" })
--===============No Neck Pain=================--
local is_nnp_on = false
local function toggle_nnp()
  if not is_nnp_on then
    vim.cmd("NoNeckPain")
    vim.defer_fn(function()
      vim.cmd("Neotree float")
      vim.defer_fn(function()
        vim.cmd("Neotree close")
      end, 200)
    end, 50)
    print("NoNeckPain enabled, Neotree float...")
    is_nnp_on = not is_nnp_on
    return
  else
    vim.cmd("NoNeckPain")
    vim.cmd("Neotree left")
    print("NoNeckPain disabled, Neotree left...")
    is_nnp_on = not is_nnp_on
    return
  end
end
wk.add({
  { "<leader>n", group = "Zen Mode (NNP)" },
  { "<leader>nn", toggle_nnp, desc = "Toggle Zen Mode (NoNeckPain)" },
})

require("nvchad.mappings")
-- add yours here

local map = vim.keymap.set
local wk = require("which-key")

map("i", "jk", "<ESC>")

map("n", "<leader>ft", ":Telescope flutter commands<cr>", { silent = true }, { desc = "telescope flutter tools" })

map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><ESC>", { silent = true }, { desc = "write file to memory" })

map("n", "cq", ":q<cr>", { silent = true }, { desc = "close quickFix or Diagnostics list" })

map("n", "<leader>nd", ":NoiceDismiss<cr>", { silent = true }, { desc = "Dissmiss noice message" })

------------------------toggle lspsaga terminal--------------
map({ "n" }, "<M-t>", ":Lspsaga term_toggle<cr>", { silent = true }, { desc = "toggle lspsaga terminal" })
map({ "t" }, "<M-t>", "<C-\\><C-n>:Lspsaga term_toggle<CR>", { silent = true }, { desc = "toggle lspsaga terminal" })

wk.register({
	l = {
		name = "Lspsaga",
		c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		o = { "<cmd>Lspsaga outline<cr>", "Outline" },
		r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
		f = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
		p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
		s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
		w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
	},
}, { prefix = "<leader>" })

wk.register({
	q = {
		name = "Trouble",
		q = {
			function()
				require("trouble").toggle()
			end,
			"toggle trouble",
		},
		d = {
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			"toggle document diagnostics",
		},
		w = {
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			"toggle workspace diagnostics",
		},
		l = {
			function()
				require("trouble").toggle("loclist")
			end,
			"toggle loclist",
		},
		r = {
			function()
				require("trouble").toggle("toggle lsp_references")
			end,
			"List references",
		},
	},
}, { prefix = "<leader>" })

-- map("n", "<leader>ac", ":Lspsaga code_action <cr>", { desc = "code_actions with lspsaga" })

-- map("n", "K", ":Lspsaga hover_doc <cr>", { desc = "hover using lspsaga" })
-- map({ "n", "t" }, "<leader>tt", ":Lspsaga term_toggle <cr>", { desc = "Terminal toggle Lspsaga" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

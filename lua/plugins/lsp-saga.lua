return {
	"nvimdev/lspsaga.nvim",
	event = "lspattach",
	config = function()
		require("lspsaga").setup()
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
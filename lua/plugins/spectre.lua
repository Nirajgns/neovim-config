return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("spectre").setup( -- if you want to get items from spectre panel you can use some of the
			-- following functions to get data from spectre.
			require("spectre.actions").get_current_entry(),
			require("spectre.actions").get_all_entries(),
			require("spectre.actions").get_state(),

			-- write your custom open function
			require("spectre").open({
				is_insert_mode = true,
				-- the directory where the search tool will be started in
				cwd = "~/.config/nvim",
				search_text = "test",
				replace_text = "test",
				-- the pattern of files to consider for searching
				path = "lua/**/*.lua",
				-- the directories or files to search in
				search_paths = { "lua/", "plugin/" },
				is_close = false, -- close an exists instance of spectre and open new
			})
		)
		-- you can use all variables above on command line
		-- for example: Spectre % is_insert_mode=true cwd=~/.config/nvim
		-- in this example `%` will expand to current file.)
	end,
}

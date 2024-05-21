-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "github_dark",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.ui = {
	statusline = {
		separator_style = "round",
	},
}

M.ui = {
	nvdash = { -- Dashboard
		load_on_startup = true,
	},
}

return M

return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	setup = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		-- alternatively you can override the default configs
		require("flutter-tools").setup({
			ui = {
				-- the border type to use for all floating windows, the same options/formats
				-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
				border = "rounded",
				-- This determines whether notifications are shown with `vim.notify` or with the plugin's custom UI
				-- please note that this option is eventually going to be deprecated and users will need to
				-- depend on plugins like `nvim-notify` instead.
				notification_style = "native", -- or "plugin"
			},
			decorations = {
				statusline = {
					-- set to true to be able to use the 'flutter_tools_decorations.app_version' in your statusline
					-- this will show the current version of the flutter app from the pubspec.yaml file
					app_version = false,
					-- set to true to be able to use the 'flutter_tools_decorations.device' in your statusline
					-- this will show the currently running device if an application was started with a specific
					-- device
					device = true,
					-- set to true to be able to use the 'flutter_tools_decorations.project_config' in your statusline
					-- this will show the currently selected project configuration
					project_config = true,
				},
			},
			debugger = { -- integrate with nvim-dap + install dart code debugger
				enabled = false,
				run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
				-- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
				-- see |:help dap.set_exception_breakpoints()| for more info
				exception_breakpoints = {},
				register_configurations = function()
					require("dap").configurations.dart = {
						-- put here config that you would find in .vscode/launch.json
					}
				end,
			},
			-- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
			flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
			root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
			fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
			widget_guides = {
				enabled = false,
			},
			closing_tags = {
				highlight = "Comment", -- highlight for the closing tag
				prefix = "■", -- character to use for close tag e.g. > Widget
				enabled = true, -- set to false to disable
			},
			dev_log = {
				enabled = true,
				notify_errors = false, -- if there is an error whilst running then notify the user
				open_cmd = "tabedit", -- command to use to open the log buffer
			},
			dev_tools = {
				autostart = false, -- autostart devtools server if not detected
				auto_open_browser = false, -- Automatically opens devtools in the browser
			},
			outline = {
				open_cmd = "30vnew", -- command to use to open the outline buffer
				auto_open = false, -- if true this will open the outline automatically when it is first populated
			},
			lsp = {
				color = { -- show the derived colours for dart variables
					enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
					background = false, -- highlight the background
					background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24 })
					foreground = false, -- highlight the foreground
					virtual_text = true, -- show the highlight using virtual text
					virtual_text_str = "//", -- the virtual text character to highlight
				}, -- see the link below for details on each option:
				-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
					renameFilesWithClasses = "prompt", -- "always"
					enableSnippets = true,
					updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
				},
			},
		})

		-- connested device in statusLine
		-- function _G.statusLine()
		-- 	return vim.g.flutter_tools_decorations.app_version
		-- end
		-- vim.opt.statusline = "%!v:lua.statusLine()"
	end,
}
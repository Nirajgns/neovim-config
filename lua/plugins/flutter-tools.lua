return {
  "akinsho/flutter-tools.nvim",
  lazy = true,
  ft = "dart",
  setup = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      lsp = {
        color = {
          enabled = true,
          background = false,
          background_color = nil,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = false,
        exception_breakpoints = { "uncaughtException" },
        register_configurations = function()
          require("dap").configurations.dart = {
            {
              name = "Flutter",
              request = "launch",
              type = "dart",
              flutterMode = "debug",
            },
          }
        end,
      },
    })
  end,
}

return {
  "mfussenegger/nvim-dap",
  keys = "<leader>d",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        "dart-debug-adapter",
        -- "delve",   --or any other debugger you need
      },
    })
    require("nvim-dap-virtual-text").setup({ highlight_new_as_changed = true })

    local wk = require("which-key")
    wk.register({
      d = {
        name = "Debugger",
        c = { ":DapContinue<cr>:Neotree close<cr>", "Start/Continue" },
        i = { ":DapStepInto<cr>", "Step Into" },
        o = { ":DapStepOver<cr>", "Step Over" },
        O = { ":DapStepOut<cr>", "Step Out" },
        b = { ":DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
        t = { ":DapTerminate<cr>", "Terminate debugging" },
      },
    }, { prefix = "<leader>" })

    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Breakpoint with condition" })

    dapui.setup()

    vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}

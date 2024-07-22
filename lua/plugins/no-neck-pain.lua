return {
  "shortcuts/no-neck-pain.nvim",
  cmd = "NoNeckPain",
  keys = "<leader>np",
  config = function()
    require("no-neck-pain").setup({
      integrations = {
        NeoTree = {
          position = "left",
          reopen = true,
        },
        NvimDAPUI = {
          position = "none",
          reopen = true,
        },
      },
      width = 115,
      mappings = {
        enabled = true,
        toggle = "<Leader>np",
        toggleLeftSide = "<Leader>nql",
        toggleRightSide = "<Leader>nqr",
        widthUp = "<Leader>n=",
        widthDown = "<Leader>n-",
        scratchPad = "<Leader>ns",
      },
    })
  end,
}

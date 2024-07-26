return {
  "shortcuts/no-neck-pain.nvim",
  cmd = "NoNeckPain",
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
        toggle = false,
        toggleLeftSide = "<Leader>nql",
        toggleRightSide = "<Leader>nqr",
        widthUp = "<Leader>n=",
        widthDown = "<Leader>n-",
        scratchPad = "<Leader>ns",
      },
    })
  end,
}

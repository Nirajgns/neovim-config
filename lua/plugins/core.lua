return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- Using lazy.nvim
  {
    "cdmill/neomodern.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("neomodern").setup({
        -- optional configuration here
      })
      require("neomodern").load()
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },
  "shaunsingh/nord.nvim",
  config = function()
    require("lualine").setup({
      options = {
        -- ... your lualine config
        theme = "nord",
        -- ... your lualine config
      },
    })
  end,
}

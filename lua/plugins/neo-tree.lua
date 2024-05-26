return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
      -- possible options. These can also be functions that return these options.
      position = "left", -- left, right, top, bottom, float, current
      width = 30, -- applies to left and right positions
      height = 15, -- applies to top and bottom positions
      auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
      popup = { -- settings that apply to float position o},
      },
    },
  },
}

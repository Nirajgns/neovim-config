return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[                                                                       
                                                                           
             ████ ██████           █████      ██                     
            ███████████             █████                             
            █████████ ███████████████████ ███   ███████████   
           █████████  ███    █████████████ █████ ██████████████   
          █████████ ██████████ █████████ █████ █████ ████ █████   
        ███████████ ███    ███ █████████ █████ █████ ████ █████  
       ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                             ]]

    logo = string.rep("\n", 1) .. logo .. "\n\n"

    local opts = {
      theme = "hyper",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        shortcut = {
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        project = {
          enable = true,
          limit = 99,
          action = function()
            require("persistence").load()
            require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
            vim.cmd("Neotree close")
            vim.cmd("Neotree show")
          end,
        },
        mru = { limit = 10, cwd_only = false },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "",
            --"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
          }
        end,
      },
    }

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}

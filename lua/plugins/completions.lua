return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind-nvim",
  },
  -- Not all LSP servers add brackets when completing a function.
  -- To better deal with this, LazyVim adds a custom option to cmp,
  -- that you can configure. For example:
  --
  -- ```lua
  -- opts = {
  --   auto_brackets = { "python" }
  -- }
  -- ```
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local auto_select = true
    local ELLIPSIS_CHAR = "…"
    local MAX_LABEL_WIDTH = 20
    local MIN_LABEL_WIDTH = 20
    return {
      auto_brackets = {}, -- configure any filetype to auto add brackets
      completion = {
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      },
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "codeium" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = function(entry, vim_item)
          -- Handle the icons
          local icons = LazyVim.config.icons.kinds
          if icons[vim_item.kind] then
            vim_item.kind = icons[vim_item.kind] .. vim_item.kind
          end

          -- Handle the abbreviation formatting
          local label = vim_item.abbr
          local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
          if truncated_label ~= label then
            vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
          elseif string.len(label) < MIN_LABEL_WIDTH then
            local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
            vim_item.abbr = label .. padding
          end

          return vim_item
        end,
      },
      experimental = {
        ghost_text = false,
      },
      sorting = defaults.sorting,
    }
  end,
  main = "lazyvim.util.cmp",
}

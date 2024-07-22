return {
  "williamboman/mason.nvim",
  event = "LazyFile",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "html-lsp",
      "css-lsp",
    },
  },
}

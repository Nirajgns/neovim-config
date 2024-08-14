return {
  "williamboman/mason.nvim",
  event = "LazyFile",
  opts = {
    ensure_installed = {
      "tailwindcss-language-server",
      "lua-language-server",
      "stylua",
      "dart-debug-adapter",
      "html-lsp",
      "css-lsp",
      "prettierd",
      "eslint-lsp",
      "pyright",
      "vtsls",
      "black",
      "isort",
      "flake8",
    },
  },
}

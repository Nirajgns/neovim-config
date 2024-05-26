-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

---=================show diagnostics in insert mode===================--

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- delay update diagnostics
  update_in_insert = true,
})
--===================floating diagnostics on cursor===================--
-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
local augroup = vim.api.nvim_create_augroup("LspDiagnosticsFloat", { clear = true })

-- Set the autocommand to open the diagnostic float on CursorHold event
vim.api.nvim_create_autocmd("CursorHold", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
--------------------------------neovide------------------
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "Iosevka Nerd Font:h18"
end

vim.g.neovide_window_blurred = true

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_fullscreen = true

vim.g.neovide_cursor_smooth_blink = true

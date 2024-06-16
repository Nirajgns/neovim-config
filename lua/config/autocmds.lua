-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Neovim configuration in Lua
vim.cmd("set iskeyword-=-")

vim.cmd("set iskeyword-=A-Z")
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
vim.g.gui_font_default_size = 18
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Iosevka Nerd Font"

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

vim.g.neovide_window_blurred = true

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_fullscreen = true

vim.g.neovide_cursor_smooth_blink = true

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "i" }, "<C-+>", function()
  ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-->", function()
  ResizeGuiFont(-1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-=>", function()
  ResetGuiFont()
end, opts)

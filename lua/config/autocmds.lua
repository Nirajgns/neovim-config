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

--set set_highlight_groups for folded lines
local function set_highlight_groups()
  vim.cmd("highlight Folded guibg=none guifg=brown")
end

set_highlight_groups()

--------------------------------neovide------------------
vim.g.neovide_hide_mouse_when_typing = true
vim.g.gui_font_default_size = 15
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Iosevka Nerd Font"

--Terminal integration with catppuccin theme for gui
vim.g.terminal_color_0 = "#2e3440"
vim.g.terminal_color_1 = "#f0616a"
vim.g.terminal_color_2 = "#a3d08c"
vim.g.terminal_color_3 = "#ebcb8b"
vim.g.terminal_color_4 = "#81a1c1"
vim.g.terminal_color_5 = "#b48ead"
vim.g.terminal_color_6 = "#8fbcbb"
vim.g.terminal_color_7 = "#eceff4"
vim.g.terminal_color_8 = "#4c566a"
vim.g.terminal_color_9 = "#bf616a"
vim.g.terminal_color_10 = "#a3be8c"
vim.g.terminal_color_11 = "#ebcb8b"
vim.g.terminal_color_12 = "#81a1c1"
vim.g.terminal_color_13 = "#b48ead"
vim.g.terminal_color_14 = "#8fbcbb"
vim.g.terminal_color_15 = "#eceff4"

vim.g.neovide_fullscreen = true
vim.g.neovide_text_gamma = 1
vim.g.neovide_text_contrast = 1

vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_scale_factor = 1
vim.g.neovide_cursor_trail_size = 0.3

vim.g.neovide_cursor_animation_length = 0.2
vim.g.neovide_scroll_animation_length = 0.08
--these functions prevent neovide from scrolling on buffer switch
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.08
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.fn.timer_start(70, function()
      vim.g.neovide_scroll_animation_length = 0.2
      vim.g.neovide_cursor_animation_length = 0.08
    end)
  end,
})

--=============FONT SIZE SETTINGS IN NEOVIDE==============--
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

-- Keymaps for adjusting neovide fontsize

vim.keymap.set({ "n", "i" }, "<C-+>", function()
  ResizeGuiFont(1)
end, { desc = "increase font size" })
vim.keymap.set({ "n", "i" }, "<C-->", function()
  ResizeGuiFont(-1)
end, { desc = "decrease font size" })
vim.keymap.set({ "n", "i" }, "<C-=>", function()
  ResetGuiFont()
end, { desc = "reset font size" })

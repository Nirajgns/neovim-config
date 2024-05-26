-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy") --don't move this line from here.

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

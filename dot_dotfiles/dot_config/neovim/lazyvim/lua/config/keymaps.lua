-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<C-w>", ":wa<CR>", {
  desc = "Save all buffers",
})

map("n", "<Up>", "<nop>") -- Up arrow -> k (up)
map("n", "<Down>", "<nop>") -- Down arrow -> j (down)
map("n", "<Left>", "<nop>") -- Left arrow -> h (left)
map("n", "<Right>", "<nop>") -- Right arrow -> l (right)

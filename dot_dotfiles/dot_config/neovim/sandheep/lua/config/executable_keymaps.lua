local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- NvimTree
opts.desc = "Toggle File explorer"
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation
opts.desc = "Move focus to previous pane"
keymap.set("n", "<C-h>", "<C-w>h", opts)
opts.desc = "Move focus to below pane"
keymap.set("n", "<C-j>", "<C-w>j", opts)
opts.desc = "Move focus to above pane"
keymap.set("n", "<C-k>", "<C-w>k", opts)
opts.desc = "Move focus to next pane"
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window Management
opts.desc = "Split screen vertically"
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
opts.desc = "Split screen horizontally"
keymap.set("n", "<leader>sh", ":split<CR>", opts)
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- Save, Save all and close
opts.desc = "Save current buffer"
keymap.set("n", "<leader>w", ":w<CR>", opts)
opts.desc = "Save all buffers"
keymap.set("n", "<leader>aw", ":wa<CR>", opts)
opts.desc = "Close current buffer"
keymap.set("n", "<leader>c", ":q<CR>", opts)

-- Indentation
opts.desc = "Add indentation"
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Comment
-- opts.desc = "Toggle comment"
-- keymap.set("n", "<leader>m", "gcc", opts)
-- keymap.set("v", "<leader>_", "gcc", opts)

-- Terminal
opts.desc = "Open floating terminal"
keymap.set("n", "<C-`>", ":ToggleTerm direction=float<CR>", opts)
opts.desc = "Open horizontal terminal"
keymap.set("n", "<C-1>", ":ToggleTerm direction=horizontal size=10<CR>", opts)
opts.desc = "Save vertical buffer"
keymap.set("n", "<C-2>", ":ToggleTerm direction=vertical size=40<CR>", opts)

-- Move code vertically
opts.desc = "Move code horizontally"
keymap.set("n", "<M-j>", ":m+1<CR>", opts)
keymap.set("n", "<M-k>", ":m-2<CR>", opts)
keymap.set("v", "<M-j>", ":m '>+1<CR>gv-gv", opts)
keymap.set("v", "<m-k>", ":m '<-2<cr>gv-gv", opts)

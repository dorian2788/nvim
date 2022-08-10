local keymap = vim.keymap.set

local opts = {silent = true}

--leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Y behave like captial letters
keymap("n", "Y", "y$", opts)

-- Centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mxJ`z", opts)

-- Better window navigation
keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)

-- Clear highlights
keymap("n", "<C-h>", "<cmd>nohlsearch<CR>", opts)

--Close buffers
keymap("n", "<leader>b", ":w<bar>%bd<bar>e#<CR>", opts)

-- cpy clipboard
keymap("n", "<leader>y", '"+y', opts)

-- cpy all
keymap("n", "<leader>Y", 'gg"+yG', opts)

-- Insert --

-- undo break points
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)

-- {
-- }
-- keymap("i", "{<CR>", "{}<esc>i<CR><esc>O", opts)

-- /**
-- keymap("i", "/**<CR>", "/**<CR><CR><BS>/<esc>i*<esc>ko", opts)

-- Visual --

-- Move blocks of text
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- go down one line
keymap("v", "<leader>p", "_dP", opts)

-- cpy clipboard
keymap("v", "<leader>y", '"+y', opts)

-- Telescope --
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- TreeSitter --
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)

-- Nvim-Tree --
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Git --
keymap("n", "<leader>ga", ":Git fetch --all<CR>")
keymap("n", "<leader>grum", ":Git rebase upstream/master<CR>")
keymap("n", "<leader>grom", ":Git rebase origin/master<CR>")

keymap("n", "<leader>gh", ":diffget //3<CR>")
keymap("n", "<leader>gf", ":diffget //2<CR>")
keymap("n", "<leader>gs", ":G<CR>")
keymap("n", "<leader>gd", ":Git difftool<CR>")

local map = vim.keymap.set


-- toggleTerm
map('n', '<C-\\>', ':ToggleTerm<CR>')

-- Escape alternatives
map('i', 'jj', '<esc>')
map('i', 'kk', '<esc>')
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')

-- Closing Buffer
map('n', '<leader>q', ':bp <BAR> bd! #<CR>')

-- Switching between buffers
map('n', ',.', '<C-^><CR>')

-- Moving lines arround in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Remaing the cursor when J
map("n", "J", "mzJ`z")

-- Centralize buffer while moving up an down the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- While searching, maintain the cursor in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

-- The MOST FANTASTIC keymap
map("x", "<leader>p", "\"_dp")

-- Remove Hightligh from search
map("n", ",<Space>", ":nohlsearch<CR>")

map("i", "<C-c>", "<Esc>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

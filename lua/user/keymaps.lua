local opts = { noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Visual --
-- -- Open filefinder --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f><C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g><C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b><C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-h><C-h>', builtin.help_tags, {})

-- Stay in indent mode --
keymap("v" , "<", "<gv", opts)
keymap("v" , ">", ">gv", opts)

-- Replacement behavior --
keymap("v", "p", '"_dP', opts)

keymap("n", "<C-j>", "<C-w>j", opts)

-- Running c sharp --
keymap("i", "<f5>", "<ESC>:w<CR><C-w>jiclear<CR>dotnet run<CR><C-\\><C-n><C-w>k", opts)
keymap("n", "<f5>", ":w<CR><C-w>jiclear<CR>dotnet run<CR><C-\\><C-n><C-w>k", opts)

-- Move text up and down --
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<ESC>" , "<C-\\><C-n>",opts)




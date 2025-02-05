local map = vim.keymap.set
local opts = {noremap = true, silent = true}

vim.g.mapleader = " "

map("n", ";", ":", opts)

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- delete single character without copying into register
map('n', 'x', '"_x', opts)

-- Vertical scroll and center
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Buffers
map('n', '<Tab>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprevious<CR>', opts)
map('n', '<leader>bx', ':Bdelete!<CR>', opts) -- new buffer
map('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
map('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
map('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
map('n', '<leader>x', ':close<CR>', opts)  -- close current split window

-- Window Motion
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
map('n', '<Up>', ':resize -2<CR>', opts)
map('n', '<Down>', ':resize +2<CR>', opts)
map('n', '<Left>', ':vertical resize -2<CR>' )
map('n', '<Right>', ':vertical resize +2<CR>' )

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- terminal
map("t", "<C-h>", "<cmd>wincmd h<CR>", opts)
map("t", "<C-j>", "<cmd>wincmd j<CR>", opts)
map("t", "<C-k>", "<cmd>wincmd k<CR>", opts)
map("t", "<C-l>", "<cmd>wincmd l<CR>", opts)

-- visual mode editing
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

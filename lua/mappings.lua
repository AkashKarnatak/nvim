vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- -- Fuck escape
-- vim.api.nvim_set_keymap('',  ';;', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('!', ';;', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('x', ';;', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('s', ';;', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('l', ';;', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('c', ';;', '<C-u><BS>', {noremap = true})

-- Remap omnicomplete keys
vim.api.nvim_set_keymap('i', '<C-j>', '<C-n>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<C-p>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? \'<C-y>\' : \'<CR>\'', {expr = true, noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- resize windows easily
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w><', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>-', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>+', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>>', {noremap = true, silent = true})

-- Remap 0, $, ^
vim.api.nvim_set_keymap('n', '0', '$',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '$', '^',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '^', '0',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '0', '$h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '$', '^',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '^', '0',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', '0', '$',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', '$', '^',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', '^', '0',  {noremap = true, silent = true})

-- Remap g0, g$, g^
vim.api.nvim_set_keymap('n', 'g0', 'g$',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'g$', 'g^',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'g^', 'g0',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'g0', 'g$h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'g$', 'g^',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'g^', 'g0',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 'g0', 'g$',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 'g$', 'g^',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 'g^', 'g0',  {noremap = true, silent = true})

-- Custom text surround integration
for _, char in ipairs({'_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%'}) do
    vim.api.nvim_set_keymap('x', 'i'..char, ':<C-u>normal! T'..char..'vt'..char..'<CR>', {noremap = true})
    vim.api.nvim_set_keymap('o', 'i'..char, ':normal vi'..char..'<CR>', {noremap = true})
    vim.api.nvim_set_keymap('x', 'a'..char, ':<C-u>normal! F'..char..'vf'..char..'<CR>', {noremap = true})
    vim.api.nvim_set_keymap('o', 'a'..char, ':normal va'..char..'<CR>', {noremap = true})
end
-- Entire file text object
vim.api.nvim_set_keymap('x', 'ie', ':<C-u>normal! ggvG<CR>', {noremap = true})
vim.api.nvim_set_keymap('o', 'ie', ':normal ggvG<CR>', {noremap = true})
vim.api.nvim_set_keymap('x', 'ae', ':<C-u>normal! ggVG<CR>', {noremap = true})
vim.api.nvim_set_keymap('o', 'ae', ':normal ggVG<CR>', {noremap = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Remove highlighting
-- vim.api.nvim_set_keymap('n', ';;', ':noh<CR>:<BS>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>:<BS>', {noremap = true})
-- Enter normal mode in terminal
-- vim.api.nvim_set_keymap('t', ';;', '<C-\\><C-n>', {noremap = true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
-- Map Ctrl-Backspace to delete the previous word in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('c', '<C-h>', '<C-w>', {noremap = true})

-- Ctrl p to next item in jumplist
vim.api.nvim_set_keymap('n', '<C-p>', '<C-i>', {noremap = true, silent=true})

-- Mappings for vim-commentary
vim.api.nvim_set_keymap('n', 'cm', 'gc', {silent=true})
vim.api.nvim_set_keymap('n', 'cmm', 'gcc', {silent=true})
vim.api.nvim_set_keymap('v', 'cm', 'gc', {silent=true})

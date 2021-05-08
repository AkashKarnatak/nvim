vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
-- vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
-- vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Fuck escape
vim.api.nvim_set_keymap('',  ';;', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('!', ';;', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', ';;', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('s', ';;', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('l', ';;', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('c', ';;', '<C-u><BS>', {noremap = true})

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

-- TODO fix this
-- Terminal window navigation
--vim.cmd([[
--  tnoremap <C-h> <C-\><C-N><C-w>h
--  tnoremap <C-j> <C-\><C-N><C-w>j
--  tnoremap <C-k> <C-\><C-N><C-w>k
--  tnoremap <C-l> <C-\><C-N><C-w>l
--  inoremap <C-h> <C-\><C-N><C-w>h
--  inoremap <C-j> <C-\><C-N><C-w>j
--  inoremap <C-k> <C-\><C-N><C-w>k
--  inoremap <C-l> <C-\><C-N><C-w>l
--  tnoremap <Esc> <C-\><C-n>
--]])

-- Custom text surround integration
for i, char in ipairs({'_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%'}) do
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

-- vim.cmd([[
-- for char in [ "\_", '.', ':', ',', ';', "<bar>", '/', "<bslash>", '*', '+', "\%"]
--   execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
--   execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
--   execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
--   execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
-- endfor
-- ]])

-- TODO fix this
-- resize with arrows
--vim.cmd([[
--  nnoremap <silent> <C-Up>    :resize -2<CR>
--  nnoremap <silent> <C-Down>  :resize +2<CR>
--  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
--  nnoremap <silent> <C-Right> :vertical resize +2<CR>
--]])

-- better indenting
--vim.api.nvim_set_keymap('v', '<','<gv', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})


-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
--vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
--vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
--vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])
 
-- Remove highlighting
vim.api.nvim_set_keymap('n', ';;', ':noh<CR>:<BS>', {noremap = true})
-- Enter normal mode in terminal
vim.api.nvim_set_keymap('t', ';;', '<C-\\><C-n>', {noremap = true})
-- Map Ctrl-Backspace to delete the previous word in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('c', '<C-h>', '<C-w>', {noremap = true})

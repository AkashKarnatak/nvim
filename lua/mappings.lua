vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

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
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w><', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>-', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>+', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>>', {noremap = true, silent = true})

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

-- Swap ^ and !
vim.api.nvim_set_keymap('n', '!', '0',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '^', '!',  {noremap = true, silent = true})

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
    vim.api.nvim_set_keymap('x', 'i'..char, ':<C-u>normal! T'..char..'vt'..char..'<CR>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('o', 'i'..char, ':normal vi'..char..'<CR>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('x', 'a'..char, ':<C-u>normal! F'..char..'vf'..char..'<CR>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('o', 'a'..char, ':normal va'..char..'<CR>', {noremap = true, silent = true})
end

-- << << Text object for CPP
vim.api.nvim_set_keymap('x', 'io', [[":<C-u>execute \"normal ?<<\\\<CR\>3lv/<<\\\<CR\>2h\"<CR>"]], {expr=true, noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 'io', [[":execute \"normal ?<<\\\<CR\>3lv/<<\\\<CR\>2h\"<CR>"]], {expr=true, noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'ao', [[":<C-u>execute \"normal ?<<\\\<CR\>v/<<\\\<CR\>l\"<CR>"]], {expr=true, noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 'ao', [[":execute \"normal ?<<\\\<CR\>v/<<\\\<CR\>l\"<CR>"]], {expr=true, noremap = true, silent = true})

-- Entire file text object
vim.api.nvim_set_keymap('x', 'ie', ':<C-u>normal! ggvG<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 'ie', ':normal ggvG<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'ae', ':<C-u>normal! ggVG<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('o', 'ae', ':normal ggVG<CR>', {noremap = true, silent = true})

-- switch buffer
vim.api.nvim_set_keymap('n', 'L', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'H', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprevious<CR>', {noremap = true, silent = true})

-- Remove highlighting
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>:<BS>', {noremap = true})
-- Enter normal mode in terminal
vim.api.nvim_set_keymap('t', '<M-Esc>', '<C-\\><C-n>', {noremap = true})
-- Map Ctrl-Backspace to delete the previous word in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('c', '<C-h>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-Bs>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('c', '<C-Bs>', '<C-w>', {noremap = true})

-- Ctrl p to next item in jumplist
vim.api.nvim_set_keymap('n', '<C-p>', '<C-i>', {noremap = true, silent=true})

-- Add numbered jumps to jumplist
vim.api.nvim_set_keymap('n', 'k', [[(v:count > 1 ? "m'" . v:count : '') . 'k']], {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', [[(v:count > 1 ? "m'" . v:count : '') . 'j']], {expr = true, noremap = true, silent = true})

-- Global find and replace
vim.api.nvim_set_keymap('n', '<Leader>rr', [[(v:count > 0 ? ":\<C-u>.,.+" . v:count : ":%") . 's/\<<C-r><C-w>\>//g<Left><Left>']], {expr = true, noremap = true})

-- Easy window move
vim.api.nvim_set_keymap('n', '<Leader>wh', '<C-w>H', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>wj', '<C-w>J', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>wk', '<C-w>K', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>wl', '<C-w>L', {noremap = true, silent=true})

-- Show relative file path of the current opened buffer
vim.api.nvim_set_keymap('n', '<Leader>aa', [[:echo expand('%ph')<CR>]], {noremap = true, silent=true})
-- horizontal equivalent of zz
vim.api.nvim_set_keymap('n', 'ZZ', 'zszH', {noremap = true, silent=true})
-- Shortcuts for competitive programming
local function file_exists(path)
  local _, error = vim.loop.fs_stat(path)
  return error == nil
end
vim.api.nvim_create_user_command(
    'LoadCompe',
    function()
      if not file_exists('./.cvim_cache') then
        vim.loop.fs_mkdir('./.cvim_cache', 493)
      end
      if not file_exists('./.cvim_cache/input.txt') then
        local fd = vim.loop.fs_open('./.cvim_cache/input.txt', "w", 420)
        vim.loop.fs_close(fd)
      end
      if not file_exists('./.cvim_cache/output.txt') then
        local fd = vim.loop.fs_open('./.cvim_cache/output.txt', "w", 420)
        vim.loop.fs_close(fd)
      end
      vim.cmd([[execute winwidth(0)/3 . "vsp ./.cvim_cache/input.txt|set nobuflisted|setlocal nocursorline|set ft=input|sp ./.cvim_cache/output.txt|set nobuflisted|setlocal nocursorline|set ft=output|:norm \<C-w>h"]])
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 2 and (vim.bo.filetype == 'input' or vim.bo.filetype == 'output') then
            vim.cmd "quit"
          end
          if #vim.api.nvim_list_wins() == 1 and (vim.bo.filetype == 'input' or vim.bo.filetype == 'output') then
            vim.cmd "quit"
          end
        end
      })
    end,
    { nargs = 0 }
)
vim.api.nvim_set_keymap('n', '<leader>cc', ':LoadCompe<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', 'Q', ':Bdelete!<CR>', {noremap = true, silent=true})

vim.api.nvim_set_keymap('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], {noremap = true, silent=true})

-- Asynctasks
vim.api.nvim_set_keymap('n', '<Leader>kc', ':let g:asynctasks_term_rows=winheight(0)*10/25 | AsyncTask file-compile<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>kr', ':let g:asynctasks_term_rows=winheight(0)*10/25 | AsyncTask file-run<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ko', ':let g:asynctasks_term_rows=winheight(0)*10/25 | AsyncTask open-repl<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>kt', ':let g:asynctasks_term_rows=winheight(0)*10/25 | AsyncTask terminal<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>kd', ':let g:asynctasks_term_rows=winheight(0)*10/25 | AsyncTask file-debug<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>kb', ':let g:asynctasks_term_rows=winheight(0)*10/25 | AsyncTask project-build<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>kk', ':let g:asynctasks_term_rows=winheight(0)*10/25 | AsyncTask live-server<CR>', {noremap = true, silent = true})

-- Nvim_tree
vim.api.nvim_set_keymap('n', '<leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>nr', ':NvimTreeRefresh<CR>', {noremap = true, silent=true})

vim.g.asyncrun_open = 6
vim.g.asynctasks_term_pos = "bottom"
vim.g.asynctasks_term_rows = '' .. vim.fn.winheight(0)*10/25    -- set height for the horizontal terminal split
-- vim.g.asynctasks_term_cols = '' .. vim.fn.winheight(0)*10/25    -- set width for vertical terminal split
vim.g.asynctasks_system = "linux"
vim.g.asynctasks_extra_config = {
  "~/.config/nvim/utils/tasks.ini"
}

-- Mappings
vim.api.nvim_set_keymap('n', '<Leader>kc', ':AsyncTask file-compile<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>kr', ':AsyncTask file-run<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ko', ':AsyncTask open-repl<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>kt', ':AsyncTask terminal<CR>', {noremap = true, silent = true})

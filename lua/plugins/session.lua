vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup {
  log_level = 'error',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  auto_session_create_enabled = false,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  bypass_session_save_file_types = nil,
  pre_save_cmds = {":NvimTreeClose"},
  post_save_cmds = {":exe 'NvimTreeOpen' | echo 'Session saved'"},
  post_restore_cmds = {":NvimTreeOpen"},
  session_lens = {
    -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
    load_on_setup = true,
    theme = 'dropdown',
    theme_conf = { border = true, winblend = 0 },
    previewer = false,
  },
}

-- Mappings
vim.api.nvim_set_keymap('n', '<space>ss', ':SessionSave<CR>', {noremap = true, silent = true})
vim.keymap.set("n", "<Leader>fs", require("auto-session.session-lens").search_session, {
  noremap = true,
})

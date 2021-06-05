vim.o.completeopt = "menuone,noselect"
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Configs
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable'; -- set to 'always' to automatically select the first option
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    tags = true;
    files = true;
    --calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

-- Mappings
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()',                {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<CR>',      'compe#confirm(\'<CR>\')',         {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-e>',     'compe#close(\'<C-e\')',           {expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<C-f>',     'compe#scroll({ \'delta\': +4 })', {expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<C-d>',     'compe#scroll({ \'delta\': -4 })', {expr = true, noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<C-l>', '<C-o> :lua vim.lsp.buf.signature_help()<CR>', {silent=true})

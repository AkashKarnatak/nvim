------------ Package managers ---------------
require('packer_nvim')

--------------- Kebindings ------------------
require('mappings')

------------ General settings ---------------
require('settings')

----------------- Themes --------------------
require('one-nvim')
-- require('space-nvim')
-- require('monokai')
-- require('zephyr')

-------------- Extra plugins ----------------
require('treesitter')
require('lsp')
require('completion-nvim')
require('autopairs')
require('asynctasks')
require('gitsign')
require('telescope_')
require('rooter_')
require('statusline')

------------------- LSP ---------------------
require('lsp/python-ls')
require('lsp/cxx-ls')
require('lsp/lua-ls')

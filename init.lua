------------ Package managers ---------------
require('packer_nvim')

--------------- Kebindings ------------------
require('mappings')

------------ General settings ---------------
require('settings')

----------------- Themes --------------------
require('sonokai_')
-- require('one-nvim')
-- require('space-nvim')
-- require('monokai')
-- require('zephyr')

-------------- Extra plugins ----------------
require('treesitter')
require('lsp')
require('nvim-compe')
require('autopairs')
require('asynctasks')
require('gitsign')
require('telescope_')
require('rooter_')
require('statusline')
require('nvim_colorizer_')
require('LuaSnip_')

------------------- LSP ---------------------
require('lsp/python-ls')
require('lsp/cxx-ls')
require('lsp/lua-ls')
require('lsp/racket-ls')
require('lsp/html-ls')
require('lsp/css-ls')

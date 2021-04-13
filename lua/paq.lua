vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function

-- This package need to be present as a plugin otherwise paq will prompt to remove itself
paq {'savq/paq-nvim', opt=true}
-- Repeat commands
paq { 'tpope/vim-repeat', opt=true }
-- Vim actions
paq { 'tpope/vim-surround', opt=true }
-- Vim verbs
paq { 'AkashKarnatak/vim-commentary', opt=true }
paq { 'vim-scripts/replacewithregister', opt=true }
-- Vim nouns
paq { 'michaeljsmith/vim-indent-object', opt=true }
-- Improves syntax highlighting and indentation
paq {'nvim-treesitter/nvim-treesitter', opt=true, run = ':TSUpdate'}
-- LSP
paq { 'neovim/nvim-lspconfig', opt=true }

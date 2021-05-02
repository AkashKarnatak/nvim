local packer = require('packer')

return packer.startup(function()
    -- This package need to be present as a plugin otherwise packer will prompt to remove itself
    use 'wbthomason/packer.nvim'
    -- Repeat commands
    use 'tpope/vim-repeat'
    -- Vim actions
    use 'tpope/vim-surround'
    -- Vim verbs
    use 'AkashKarnatak/vim-commentary'
    use 'vim-scripts/replacewithregister'
    -- Vim nouns
    use 'michaeljsmith/vim-indent-object'
    -- Improves syntax highlighting and indentation
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- LSP
    use 'neovim/nvim-lspconfig'
    -- Autocompletion
    use 'nvim-lua/completion-nvim'
    -- Bracket completion
    use 'windwp/nvim-autopairs'
    -- Tokyonight colorscheme
    use 'folke/tokyonight.nvim'
end)

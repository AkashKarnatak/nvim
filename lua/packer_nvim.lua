local packer = require('packer')

packer.init({
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    }
})

return packer.startup(function()
    -- This package need to be present as a plugin otherwise packer will prompt to remove itself
    use 'wbthomason/packer.nvim'
    -- Repeat commands
    use 'tpope/vim-repeat'
    -- Vim actions
    use 'tpope/vim-surround'
    -- Vim verbs
    use 'tpope/vim-commentary'
    use 'AkashKarnatak/replacewithregister'
    -- Vim nouns
    use 'michaeljsmith/vim-indent-object'
    -- Improves syntax highlighting and indentation
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- LSP
    use 'neovim/nvim-lspconfig'
    -- Autocompletion
    use 'hrsh7th/nvim-compe'
    -- Bracket completion
    use 'windwp/nvim-autopairs'
    -- Task builder
    use 'skywind3000/asynctasks.vim'
    use 'skywind3000/asyncrun.vim'
    -- Git integration
    use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim' }}
    -- Markdown
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = {'markdown'} }
    -- Fzf
    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    -- Rooter
    use 'ygm2/rooter.nvim'
    -- Devicons
    use 'kyazdani42/nvim-web-devicons'
    -- Statusline
    use 'hoob3rt/lualine.nvim'
    -- Sonokai theme
    use 'sainnhe/sonokai'
    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'
    -- treesitter textobject
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    -- treesitter playground
    use 'nvim-treesitter/playground'
    -- debugging
    use 'mfussenegger/nvim-dap'
    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'AkashKarnatak/friendly-snippets'
    -- nvim-tree
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
    -- dashboard
    use 'glepnir/dashboard-nvim'
    -- bufferline
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- -- Copilot
    -- use 'github/copilot.vim'
    -- -- firenvim
    -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    -- ========= trouble.nvim ============
    -- ========= nvim-cmp ============
end)

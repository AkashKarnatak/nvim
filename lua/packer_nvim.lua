-- load packer.nvim
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init({
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    }
})

return packer.startup(function()
    -- This package need to be present as a plugin otherwise packer will prompt to remove itself
    use {
      "wbthomason/packer.nvim",
      event = "VimEnter"
    }
    -- Repeat commands
    use {
      "tpope/vim-repeat",
      after = "packer.nvim",
    }
    -- Vim actions
    use {
      "tpope/vim-surround",
      after = "packer.nvim",
    }
    -- Vim verbs
    use {
      "tpope/vim-commentary",
      after = "packer.nvim",
    }
    use {
      "AkashKarnatak/replacewithregister",
      after = "packer.nvim",
    }
    -- Vim nouns
    use {
      "michaeljsmith/vim-indent-object",
      after = "packer.nvim",
    }
    -- Improves syntax highlighting and indentation
    use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
        require "plugins.treesitter"
      end
    }
    -- LSP
    use {
      "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require "plugins.lsp"
        require('plugins.lsp.python-ls')
        require('plugins.lsp.cxx-ls')
        require('plugins.lsp.lua-ls')
        require('plugins.lsp.racket-ls')
        require('plugins.lsp.html-ls')
        require('plugins.lsp.css-ls')
        require('plugins.lsp.javascript-ls')
        require('plugins.lsp.emmet-ls')
        vim.cmd([[LspStart]])
      end
    }
    -- Autocompletion
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
        require "plugins.nvim_compe"
      end,
    }
    -- Bracket completion
    use {
      "windwp/nvim-autopairs",
      after = "nvim-compe",
      config = function()
        require "plugins.autopairs"
      end
    }
    -- Task builder
    use {
      "skywind3000/asyncrun.vim",
      cmd = "AsyncTask",
    }
    use {
      "skywind3000/asynctasks.vim",
      cmd = "AsyncTask",
      config = function()
        require "plugins.asynctasks"
      end
    }
    -- Git integration
    use {
      "nvim-lua/plenary.nvim",
      event = "BufRead"
    }
    use {
      "lewis6991/gitsigns.nvim",
      after = "plenary.nvim",
      config = function()
        require "plugins.gitsigns"
      end
    }
    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = 'cd app && yarn install',
      ft = {'markdown'}
    }
    -- Fzf
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      cmd = "Telescope",
      config = function()
        require "plugins.telescope"
      end
    }
    -- theme
    -- use {
    --   "sainnhe/sonokai",
    --   after = "packer.nvim",
    --   config = function()
    --     require "plugins.sonokai"
    --   end
    -- }
    use({
      'NTBBloodbath/doom-one.nvim',
      after = "packer.nvim",
      config = function()
        require('plugins.doom-one')
      end,
    })

    -- project manager
    use {
      "ygm2/rooter.nvim",
      after = "packer.nvim",
      config = function()
        require "plugins.rooter"
      end
    }
    -- bufferline
    use {
      "akinsho/nvim-bufferline.lua",
      after = "doom-one.nvim",
      config = function()
        require("plugins.bufferline")
      end
    }
    -- Statusline
    -- use {
    --   "nvim-lualine/lualine.nvim",
    --   after = "sonokai",
    --   config = function()
    --     require "plugins.statusline"
    --   end
    -- }
    use({
      "NTBBloodbath/galaxyline.nvim",
      after = "nvim-web-devicons",
      config = function()
        require('plugins.galaxyline')
      end,
    })

    -- Devicons
    use {
      "kyazdani42/nvim-web-devicons",
      after = "packer.nvim",
    }
    -- Colorizer
    use {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
        require("plugins.nvim_colorizer")
      end
    }
    -- treesitter textobject
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      config = function()
        require "plugins.nvim_treesitter_textobjects"
      end
    }
    -- treesitter playground
    use {
      "nvim-treesitter/playground",
      after = "nvim-treesitter",
      config = function()
        require "plugins.nvim_treesitter_playground"
      end
    }

    -- debugging
    -- use 'mfussenegger/nvim-dap'
    -- snippets
    -- use 'L3MON4D3/LuaSnip'
    -- use 'AkashKarnatak/friendly-snippets'

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
        require "plugins.nvim_tree"
      end
    }

    -- -- dashboard
    -- use {
    --   "glepnir/dashboard-nvim",
    --   cmd = "Dashboard",
    --   config = function()
    --     require("plugins.dashboard")
    --   end
    -- }

    -- -- Copilot
    -- use 'github/copilot.vim'
    -- -- firenvim
    -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    -- ========= trouble.nvim ============
    -- ========= nvim-cmp ============
end)

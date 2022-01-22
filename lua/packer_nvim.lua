-- load packer.nvim
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init({
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  }
})

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_nvim.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function()
    -- This package need to be present as a plugin otherwise packer will prompt to remove itself
    use {
      "wbthomason/packer.nvim",
      event = "VimEnter"
    }

    -- Properly close vim buffer
    use {
      "moll/vim-bbye",
      cmd = "Bdelete"
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

    -- comment
    use {
      "numToStr/Comment.nvim",
      after = "nvim-ts-context-commentstring",
      config = function()
        require "plugins.comment_nvim"
      end
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
     event = "BufRead"
    }
   use {
     "JoosepAlviste/nvim-ts-context-commentstring",
      after = "nvim-treesitter",
      config = function()
        require "plugins.treesitter"
      end
   }
    -- treesitter textobject
    -- use {
    --   "nvim-treesitter/nvim-treesitter-textobjects",
    --   after = "nvim-treesitter",
    --   config = function()
    --     require "plugins.nvim_treesitter_textobjects"
    --   end
    -- }
    -- -- treesitter playground
    -- use {
    --   "nvim-treesitter/playground",
    --   after = "nvim-treesitter",
    --   config = function()
    --     require "plugins.nvim_treesitter_playground"
    --   end
    -- }


    -- Autocompletion and LSP
    use {
      "hrsh7th/cmp-nvim-lsp",
      event = "BufRead"
    }
    use {
      "neovim/nvim-lspconfig",
      after = "cmp-nvim-lsp",
      config = function()
        require "plugins.lspconfig"
      end
    }
    use {
      "AkashKarnatak/friendly-snippets",
      after = "packer.nvim"
    }
    use {
      "L3MON4D3/LuaSnip",
      after = "friendly-snippets"
    }
    use {
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip"
    }
    use {
      "hrsh7th/nvim-cmp",
      after = "LuaSnip",
      config = function()
        require "plugins.nvim_cmp"
      end
    }
    use {
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp"
    }
    use {
      "hrsh7th/cmp-path",
      after = "cmp-buffer"
    }
    use {
      "hrsh7th/cmp-cmdline",
      after = "cmp-path"
    }
    use {
      "ray-x/lsp_signature.nvim",
      after = "nvim-cmp",
      config = function()
        require("plugins.lsp_signature")
      end
    }

    -- Bracket completion
    use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
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
      after = "asyncrun.vim",
      config = function()
        require "plugins.asynctasks"
      end
    }

    -- Git integration
    use {
      "nvim-lua/plenary.nvim",
      after = "packer.nvim",
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

    -- Fuzzy search
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      cmd = "Telescope", config = function()
        require "plugins.telescope"
      end
    }

    -- Theme
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
    use({
      "NTBBloodbath/galaxyline.nvim",
      after = "nvim-web-devicons",
      config = function()
        require("plugins.eviline")
      end,
    })

    -- Devicons
    use {
      "kyazdani42/nvim-web-devicons",
      after = "packer.nvim",
      config = function()
        require("plugins.webdevicons")
      end,
    }

    -- Colorizer
    use {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
        require("plugins.nvim_colorizer")
      end
    }

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
        require "plugins.nvim_tree"
      end
    }

    -- dashboard
    use {
      "glepnir/dashboard-nvim",
      cmd = {
        "Dashboard",
        "DashboardNewFile",
        "DashboardJumpMarks",
        "SessionLoad",
        "SessionSave"
      },
      config = function()
        require("plugins.dashboard")
      end
    }

    -- Debugging
    use {
      "mfussenegger/nvim-dap",
			keys = {
				{'n', '<M-x>'},
				{'n', '<leader>dc'},
				{'n', '<leader>dl'},
			},
    }
    use {
      "rcarriga/nvim-dap-ui",
			after = "nvim-dap",
      config = function()
        require("plugins.nvim_dap")
      end
    }

end)

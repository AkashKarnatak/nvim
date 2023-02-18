local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print '=================================='
  print '   Your plugin manager is being'
  print '   installed.'
  print '   Cloning into lazy.nvim...'
  print '=================================='
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    -- Properly close vim buffer
    {
      "moll/vim-bbye",
      cmd = "Bdelete"
    },

    -- Repeat commands
    {
      "tpope/vim-repeat",
    },

    -- Vim actions
    {
      "tpope/vim-surround",
    },

    {
      "AkashKarnatak/replacewithregister",
    },

    -- Improves syntax highlighting and indentation
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require "plugins.treesitter"
      end
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = true,
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      lazy = true,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugins.indent-blankline")
      end
    },
    -- comment
    {
      "numToStr/Comment.nvim",
      config = function()
        require "plugins.comment_nvim"
      end
    },

    -- Autocompletion and LSP
    {
      "hrsh7th/nvim-cmp",
      config = function()
        require "plugins.nvim_cmp"
      end
    },
    {
      "hrsh7th/vim-vsnip",
      lazy = true,
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      lazy = true,
    },
    {
      "hrsh7th/cmp-path",
      lazy = true,
    },
    {
      "hrsh7th/cmp-buffer",
      lazy = true,
    },
    {
      "hrsh7th/cmp-vsnip",
      lazy = true,
    },
    {
      "AkashKarnatak/friendly-snippets",
      lazy = true,
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "plugins.lsp"
      end
    },
    {
      "williamboman/mason.nvim",
      lazy = true,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = true,
    },
    {
      "simrat39/rust-tools.nvim",
      lazy = true,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      lazy = true,
    },
    {
      "windwp/nvim-autopairs",
      config = function()
        require "plugins.autopairs"
      end
    },
    {
      "windwp/nvim-ts-autotag",
      lazy = true,
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("plugins.lsp_signature")
      end
    },
    {
      "RRethy/vim-illuminate",
      config = function()
        require("plugins.illuminate")
      end
    },
    -- {
    --   "kevinhwang91/nvim-ufo",
    --   requires = "kevinhwang91/promise-async",
    --   after = "lsp_signature.nvim",
    --   config = function()
    --     require("plugins.nvim-ufo")
    --   end
    -- }
    {
      "mfussenegger/nvim-jdtls",
      ft = { "java" },
      config = function()
        require("plugins.jdtls")
      end
    },

    -- Task builder
    {
      "skywind3000/asyncrun.vim",
      cmd = "AsyncTask",
      config = function()
        require "plugins.asynctasks"
      end
    },
    {
      "skywind3000/asynctasks.vim",
      lazy = true,
    },
    {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      keys = {
        { "<C-_>", mode = 'n' }
      },
      config = function()
        require "plugins.toggleterm"
      end
    },

    -- Git integration
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require "plugins.gitsigns"
      end
    },

    -- Markdown
    {
      "iamcco/markdown-preview.nvim",
      build = 'cd app && npm install',
      ft = { 'markdown' }
    },

    -- Fuzzy search
    {
      "nvim-telescope/telescope.nvim",
      keys = {
        { '<space>ff', mode = 'n' },
        { '<space>fo', mode = 'n' },
        { '<space>fw', mode = 'n' },
        { '<space>fm', mode = 'n' },
        { '<space>fr', mode = 'n' },
        { '<space>f/', mode = 'n' },
        { '<space>fc', mode = 'n' },
        { '<space>fh', mode = 'n' },
        { '<space>fg', mode = 'n' },
        { '<space>fp', mode = 'n' },
        { '<space>fr', mode = 'n' },
        { '<space>fb', mode = 'n' },
        { 'gd', mode = 'n' },
        { 'gi', mode = 'n' },
        { 'gr', mode = 'n' },
        { '<space>ld', mode = 'n' },
        { '<space>ls', mode = 'n' },
      },
      cmd = "Telescope",
      config = function()
        require "plugins.telescope"
      end
    },

    -- Theme
    {
      'NTBBloodbath/doom-one.nvim',
      commit = "98b23b0eb3d47f908ae2d2b77dd7bad42f566340",
      priority = 1000,
      config = function()
        require('plugins.doom-one')
      end,
    },

    -- project manager
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("plugins.project_nvim")
      end
    },

    -- bufferline
    {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require("plugins.bufferline")
      end
    },

    -- Statusline
    {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("plugins.eviline")
      end,
    },

    -- Devicons
    {
      "kyazdani42/nvim-web-devicons",
      lazy = true,
      config = function()
        require("plugins.webdevicons")
      end,
    },

    -- Colorizer
    {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("plugins.nvim_colorizer")
      end
    },

    -- nvim-tree
    {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require "plugins.nvim_tree"
      end
    },

    -- Debugging
    {
      "mfussenegger/nvim-dap",
      keys = {
        { '<M-x>', mode = 'n' },
        { '<M-c>', mode = 'n' },
        { '<space>dc', mode = 'n' },
        { '<space>dl', mode = 'n' },
      },
      config = function()
        require("plugins.nvim_dap")
      end
    },
    {
      "rcarriga/nvim-dap-ui",
      commit = "ffe3e589fe2861b5ed0486832b0974e94587ae23",
      lazy = true,
    },

    -- Session manager
    {
      "rmagatti/auto-session",
      config = function()
        require("plugins.session")
      end,
    },

    -- Orgmode
    {
      "nvim-neorg/neorg",
      ft = "norg",
      config = function()
        require("plugins.neorg")
      end,
    },

    -- Change tabline behaviour
    {
      "tiagovla/scope.nvim",
      config = function()
        require("plugins.scope")
      end,
    },

    -- Quick motion
    {
      'ggandor/leap.nvim',
      config = function()
        require("plugins.leap")
      end
    },
    {
      'ggandor/leap-spooky.nvim',
      lazy = true,
    },
  },
  {
    ui = {
      border = 'rounded'
    }
  }
)
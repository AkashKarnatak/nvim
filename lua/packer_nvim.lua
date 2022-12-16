-- load packer.nvim
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init({
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 6000 },
  display = {
    prompt_border = 'rounded',
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
})

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_nvim.lua source <afile> | PackerSync
  augroup end
]]

return packer.startup({
  function()
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

    -- Load nvim configs faster
    use {
      "lewis6991/impatient.nvim",
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

    use {
      "AkashKarnatak/replacewithregister",
      after = "packer.nvim",
    }

    -- Improves syntax highlighting and indentation
    use {
      "nvim-treesitter/nvim-treesitter",
    }
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter"
    }
    use {
      "JoosepAlviste/nvim-ts-context-commentstring",
      after = "nvim-treesitter-textobjects",
      config = function()
        require "plugins.treesitter"
      end
    }
    -- comment
    use {
      "numToStr/Comment.nvim",
      after = "nvim-ts-context-commentstring",
      config = function()
        require "plugins.comment_nvim"
      end
    }

    -- Autocompletion and LSP
    use {
      "AkashKarnatak/friendly-snippets",
      after = "nvim-treesitter"
    }
    use {
      "hrsh7th/vim-vsnip",
      after = "friendly-snippets"
    }
    use {
      "hrsh7th/nvim-cmp",
      after = "vim-vsnip"
    }
    use {
      "hrsh7th/cmp-nvim-lsp",
      after = "nvim-cmp"
    }
    use {
      "hrsh7th/cmp-path",
      after = "cmp-nvim-lsp"
    }
    use {
      "hrsh7th/cmp-buffer",
      after = "cmp-path"
    }
    use {
      "hrsh7th/cmp-vsnip",
      after = "cmp-buffer",
      config = function()
        require "plugins.nvim_cmp"
      end
    }
    use {
      "neovim/nvim-lspconfig",
      after = "cmp-vsnip",
    }
    use {
      "simrat39/rust-tools.nvim",
      after = "nvim-lspconfig",
    }
    use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "rust-tools.nvim",
      config = function()
        require "plugins.lsp"
      end
    }
    use {
      "windwp/nvim-autopairs",
      after = "null-ls.nvim",
      config = function()
        require "plugins.autopairs"
      end
    }
    use {
      "windwp/nvim-ts-autotag",
      after = "nvim-autopairs",
    }
    use {
      "ray-x/lsp_signature.nvim",
      after = "nvim-ts-autotag",
      config = function()
        require("plugins.lsp_signature")
      end
    }
    use {
      "RRethy/vim-illuminate",
      after = "null-ls.nvim",
    }
    -- use {
    --   "kevinhwang91/nvim-ufo",
    --   requires = "kevinhwang91/promise-async",
    --   after = "lsp_signature.nvim",
    --   config = function()
    --     require("plugins.nvim-ufo")
    --   end
    -- }
    use {
      "mfussenegger/nvim-jdtls",
      wants = {
        "nvim-treesitter",
        "nvim-ts-context-commentstring",
        "friendly-snippets",
        "vim-vsnip",
        "nvim-cmp",
        "cmp-nvim-lsp",
        "cmp-path",
        "cmp-buffer",
        "cmp-vsnip",
        "nvim-lspconfig",
        "null-ls.nvim",
        "lsp_signature.nvim",
      },
      ft = {"java"},
      config = function()
        require("plugins.jdtls")
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
    use {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      keys = {
        {"n", "<C-_>"}
      },
      config = function()
        require "plugins.toggleterm"
      end
    }

    -- Git integration
    use {
      "nvim-lua/plenary.nvim",
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
      run = 'cd app && npm install',
      ft = {'markdown'}
    }

    -- Fuzzy search
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      keys = {
        {'n', '<space>ff'},
        {'n', '<space>fo'},
        {'n', '<space>fw'},
        {'n', '<space>fm'},
        {'n', '<space>fr'},
        {'n', '<space>f/'},
        {'n', '<space>fc'},
        {'n', '<space>fh'},
        {'n', '<space>fg'},
        {'n', '<space>fp'},
        {'n', '<space>fr'},
        {'n', 'gd'},
        {'n', 'gi'},
        {'n', 'gr'},
        {'n', '<space>ld'},
        {'n', '<space>ls'},
      },
      cmd = "Telescope",
      config = function()
        require "plugins.telescope"
      end
    }

    -- Theme
    use({
      'NTBBloodbath/doom-one.nvim',
      commit = "98b23b0eb3d47f908ae2d2b77dd7bad42f566340",
      after = "packer.nvim",
      config = function()
        require('plugins.doom-one')
      end,
    })

    -- project manager
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("plugins.project_nvim")
      end
    }

    -- bufferline
    use {
      "akinsho/nvim-bufferline.lua",
      after = "nvim-treesitter",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("plugins.bufferline")
      end
    }

    -- Statusline
    use({
      "nvim-lualine/lualine.nvim",
      after = "nvim-web-devicons",
      config = function()
        require("plugins.eviline")
      end,
    })

    -- Devicons
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins.webdevicons")
      end,
    }

    -- Colorizer
    use {
      "RRethy/vim-hexokinase",
      run = "make hexokinase",
      -- cmd = "HexokinaseToggle",
      config = function()
        require("plugins.nvim_colorizer")
      end
    }

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require "plugins.nvim_tree"
      end
    }

    -- Debugging
    use {
      "mfussenegger/nvim-dap",
      keys = {
        {'n', '<M-x>'},
        {'n', '<M-c>'},
        {'n', '<space>dc'},
        {'n', '<space>dl'},
      },
    }
    use {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = function()
        require("plugins.nvim_dap")
      end
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      after = "nvim-treesitter",
      config = function()
        require("plugins.indent-blankline")
      end
    }

    -- Session manager
    use({
      "rmagatti/auto-session",
      -- module = "persisted", -- For lazy loading
      config = function()
        require("plugins.session")
      end,
    })

    -- Orgmode
    use {
      "nvim-neorg/neorg",
      ft = "norg",
      config = function()
        require("plugins.neorg")
      end,
      requires = "nvim-lua/plenary.nvim"
    }

    -- Change tabline behaviour
    use {
      "tiagovla/scope.nvim",
      config = function()
        require("plugins.scope")
      end,
    }

    -- Quick motion
    use {
      'ggandor/leap.nvim',
    }
    use {
      'ggandor/leap-spooky.nvim',
      after = 'leap.nvim',
      config = function()
        require("plugins.leap")
      end
    }
  end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
    snapshot_path = vim.fn.stdpath('config')..'/snapshots'
  }
})

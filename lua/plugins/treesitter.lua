local nvim_treesitter_configs = require('nvim-treesitter.configs')
nvim_treesitter_configs.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  indent = {
    enable = true,
		disable = {
			"c",
			"cpp",
			"yaml",
      "lua"
		}
  },
	autopairs = {
		enable = true
	},
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

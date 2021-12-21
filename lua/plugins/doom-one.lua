require('doom-one').setup({
	cursor_coloring = true,
	terminal_colors = false,
	italic_comments = true,
	enable_treesitter = true,
	transparent_background = false,
	pumblend = {
		enable = false,
		transparency_amount = 20,
	},
	plugins_integrations = {
		neorg = false,
		barbar = false,
		bufferline = true,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		neogit = false,
		nvim_tree = true,
		dashboard = false,
		startify = false,
		whichkey = false,
		indent_blankline = false,
		vim_illuminate = false,
		lspsaga = false,
	},
})

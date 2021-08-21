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

------------------- LSP ---------------------
require('lsp/python-ls')
require('lsp/cxx-ls')
require('lsp/lua-ls')
require('lsp/racket-ls')

require 'colorizer'.setup {
  less = {
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = true;        -- #RRGGBBAA hex codes
	rgb_fn   = true;        -- CSS rgb() and rgba() functions
	hsl_fn   = true;        -- CSS hsl() and hsla() functions
	css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'background'; -- Set the display mode.
  }
}

local telescopeBorderless = function(flavor)
  local cp = require("catppuccin.palettes").get_palette(flavor)

  return {
    TelescopeBorder = { fg = cp.mantle, bg = cp.mantle },
    TelescopeSelectionCaret = { fg = cp.flamingo, bg = cp.surface1 },
    TelescopeMatching = { fg = cp.peach },
    TelescopeNormal = { bg = cp.mantle },
    TelescopeSelection = { fg = cp.text, bg = cp.surface1 },
    TelescopeMultiSelection = { fg = cp.text, bg = cp.surface2 },

    TelescopeTitle = { fg = cp.crust, bg = cp.green },
    TelescopePreviewTitle = { fg = cp.crust, bg = cp.red },
    TelescopePromptTitle = { fg = cp.crust, bg = cp.mauve },

    TelescopePromptNormal = { fg = cp.flamingo, bg = cp.crust },
    TelescopePromptBorder = { fg = cp.crust, bg = cp.crust },
  }
end
local color_palette = {
	rosewater = "#F4DBD6",
	flamingo = "#F0C6C6",
	pink = "#F5BDE6",
	mauve = "#C6A0F6",
	red = "#ED8796",
	maroon = "#EE99A0",
	peach = "#F5A97F",
	yellow = "#EED49F",
	green = "#A6DA95",
	teal = "#8BD5CA",
	sky = "#91D7E3",
	sapphire = "#7DC4E4",
	blue = "#8AADF4",
	lavender = "#B7BDF8",

	text = "#CAD3F5",
	subtext1 = "#B8C0E0",
	subtext0 = "#A5ADCB",
	overlay2 = "#939AB7",
	overlay1 = "#8087A2",
	overlay0 = "#6E738D",
	surface2 = "#5B6078",
	surface1 = "#494D64",
	surface0 = "#363A4F",

	base = "#24273A",
	mantle = "#1E2030",
	crust = "#181926",
}


require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "macchiato",
  },
  transparent_background = false,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  -- highlight_overrides = {
  --   latte = telescopeBorderless('latte'),
  --   frappe = telescopeBorderless('frappe'),
  --   macchiato = telescopeBorderless('macchiato'),
  --   mocha = telescopeBorderless('mocha'),
  -- },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    leap = true,
    illuminate = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
  },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

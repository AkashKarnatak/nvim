require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return vim.fn.winheight(0) * 0.8
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-_>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  highlights = {
    NormalFloat = {
      link = 'Normal',
    },
    FloatBorder = {
      link = 'FloatBorder',
    },
  },
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  -- persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
  }
}

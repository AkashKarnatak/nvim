local function set_nvimtree_when_open_term(terminal)
  local nvimtree = require "nvim-tree.api".tree
  local nvimtree_view = require "nvim-tree.view"
  if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
    local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
    nvimtree.toggle()
    nvimtree_view.View.width = nvimtree_width
    nvimtree.toggle(false, true)
  end
end

require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return vim.fn.winheight(0) * 0.8
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-/>]],
  on_open = set_nvimtree_when_open_term,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  highlights = {
    NormalFloat = {
      link = 'NormalFloat',
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

vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {noremap = true, silent=true, desc="Open terminal in horizontal split"})
vim.api.nvim_set_keymap('n', '<leader>th', ':2ToggleTerm direction=horizontal<CR>', {noremap = true, silent=true, desc="Open terminal in horizontal split"})
vim.api.nvim_set_keymap('n', '<leader>tv', ':2ToggleTerm direction=vertical<CR>', {noremap = true, silent=true, desc="Open terminal in vertical split"})

local function send_visual_lines()
  -- This function is copied from:
  -- https://github.com/akinsho/toggleterm.nvim/issues/425#issuecomment-1854373704

  -- visual markers only update after leaving visual mode
  local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)

  -- get selected text
  local start_line, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_line, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  local lines = vim.fn.getline(start_line, end_line)

  -- send selection with trimmed indent
  local cmd = ""
  local indent = nil
  for _, line in ipairs(lines) do
    if indent == nil and line:find("[^%s]") ~= nil then
      indent = line:find("[^%s]")
    end
    -- (i)python interpreter evaluates sent code on empty lines -> remove
    if not line:match("^%s*$") then
      cmd = cmd .. line:sub(indent or 1) .. string.char(13) -- trim indent
    end
  end
  require("toggleterm").exec(cmd, 1)
end

vim.keymap.set("n", "<S-CR>", function()
  vim.cmd.normal({ "vap", bang = true })
  send_visual_lines()
end)

vim.keymap.set("v", "<S-CR>", function()
  send_visual_lines()
end)

vim.api.nvim_create_user_command("IPython", function()
  local terminal =
      require("toggleterm.terminal").Terminal:new({ cmd = "ipython --no-autoindent", direction = "vertical" })
  terminal:toggle()
end, { nargs = 0 })

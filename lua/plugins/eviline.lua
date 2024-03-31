vim.o.showmode = false
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = require("catppuccin.palettes").get_palette "macchiato"

local short_line_tbl = {
  ["NvimTree"] = true,
  ["packer"] = true,
  ["netrw"] = true,
  ["dapui_scopes"] = true,
  ["dapui_breakpoints"] = true,
  ["dapui_stacks"] = true,
  ["dapui_watches"] = true,
  ["dap-repl"] = true,
  ["toggleterm"] = true,
  ["input"] = true,
  ["output"] = true,
  ["lspinfo"] = true,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 and not short_line_tbl[vim.bo.filetype]
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80 and not short_line_tbl[vim.bo.filetype]
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return ( gitdir and #gitdir > 0 and #gitdir < #filepath ) and not short_line_tbl[vim.bo.filetype]
  end,
  short_status = function()
    return short_line_tbl[vim.bo.filetype]
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    globalstatus = true,
    theme = "catppuccin",
    cond = function()
      return not short_line_tbl[vim.bo.filetype]
    end,
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local longline = {
  lualine_c = {},
  lualine_x = {},
}

local shortline = {
  lualine_c = {},
  lualine_x = {},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  cond = function() return true end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  'filetype',
  icons_enabled = false,
  fmt = string.upper,
  cond = conditions.short_status,
  padding = { left = 0, right = 1 }, -- We don't need space before this
  color = { fg = colors.blue, gui = 'bold' },
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.mauve,
      no = colors.red,
      s = colors.peach,
      S = colors.peach,
      [''] = colors.peach,
      ic = colors.yellow,
      R = colors.pink,
      Rv = colors.pink,
      cv = colors.red,
      ce = colors.red,
      r = colors.sky,
      rm = colors.sky,
      ['r?'] = colors.sky,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.mauve, gui = 'bold' },
  symbols = {
    modified = '',      -- Text to show when the file is modified.
    readonly = '',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[New]',     -- Text to show for new created file before first writting
  }
}

ins_left {
  'location',
  color = { fg = colors.text, gui = 'bold' },
}

ins_left {
  'progress',
  padding = { left = 0, right = 1 },
  color = { fg = colors.text, gui = 'bold' }
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.blue },
    hint = { fg = colors.green },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.text, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  padding = { left = 0, right = 1 },
  color = { fg = colors.text, gui = 'bold' },
}

ins_right {
  'filetype',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.blue },
}

ins_right {
  -- Lsp server name .
  function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if next(clients) == nil then
      return ""
    end
    local msg = ""
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        msg = msg .. string.format("   %s", client.name)
      end
    end
    return string.sub(msg, 2)
  end,
  cond = function()
    local tbl = { ["dashboard"] = true, [""] = true }
    if tbl[vim.bo.filetype] then
      return false
    end
    return true
  end,
  icons_enabled = false,
  padding = { left = 0, right = 1 },
  color = { fg = colors.blue },
}

ins_right {
  'branch',
  icon = { "", color = { fg = colors.red } },
  color = { fg = colors.green },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.peach },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  cond = function() return true end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

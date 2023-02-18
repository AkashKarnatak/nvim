vim.o.showmode = false
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg = "#23272e",
  fg = "#bbc2cf",
  fg_alt = "#5B6268",
  yellow = "#ECBE7B",
  cyan = "#46D9FF",
  green = "#98be65",
  orange = "#da8548",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ff6c6b",
  violet = "#a9a1e1",
}

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

local live_server_support = {
  ["html"] = true,
  ["css"] = true,
  ["javascript"] = true,
  ["javascriptreact"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
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
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
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
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
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
  color = { fg = colors.magenta, gui = 'bold' },
  symbols = {
    modified = '',      -- Text to show when the file is modified.
    readonly = '',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[New]',     -- Text to show for new created file before first writting
  }
}

ins_left {
  'location',
  color = { fg = colors.fg_alt, gui = 'bold' },
}

ins_left {
  'progress',
  padding = { left = 0, right = 1 },
  color = { fg = colors.fg_alt, gui = 'bold' }
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

ins_left {
  -- Lsp server name .
  function()
    local Lsp = vim.lsp.util.get_progress_messages()[1]

    if Lsp then
      local msg = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = {
        "",
        "",
        "",
      }

      local success_icon = {
        "",
        "",
        "",
      }

      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners

      if percentage >= 70 then
        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
      end

      return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
    end

    return ""
  end,
  color = { fg = colors.violet },
}

-- vim.cmd([[highlight LspStatusLineLabel guifg=#ffa8ff guibg=#23272e]])
-- vim.cmd([[highlight LspStatusLineHint guifg=#bbc2cf guibg=#2257a0 gui=bold]])
-- ins_left {
--   function()
--     if vim.fn.mode() ~= 'i' then
--       return ''
--     end
--     local sig = require("lsp_signature").status_line(80)
--     local i = sig.range['start']
--     local j = sig.range['end']
--     return '%#LspStatusLineLabel#'
--       .. string.sub(sig.label, 1, i-1)
--       .. "%*"
--       .. '%#LspStatusLineHint#'
--       .. string.sub(sig.label, i, j)
--       .. "%*"
--       .. '%#LspStatusLineLabel#'
--       .. string.sub(sig.label, j+1, -1)
--       .. "%*"
--   end,
-- }

-- ins_right {
--   'fileformat',
--   fmt = string.upper,
--   padding = { left = 1, right = 0 },
--   color = { fg = colors.fg, gui = 'bold' },
-- }

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  padding = { left = 0, right = 1 },
  color = { fg = colors.fg, gui = 'bold' },
}

local Job = require'plenary.job'
local live_server_enabled = false
local live_server

ins_right {
  function()
    return ''
  end,
  cond = function()
    return live_server_support[vim.bo.filetype]
  end,
  on_stdout = function(_, line)
    vim.cmd([[:echo 'hi: ]] .. vim.inspect.inspect(line) .. [[']])
  end,
  on_stderr = function(_, line)
    vim.cmd([[:echo 'hi: ]] .. vim.inspect.inspect(line) .. [[']])
  end,
  on_exit = function()
    vim.cmd([[:echo 'what the fuck']])
  end,
  on_click = function()
    live_server_enabled = not live_server_enabled
    if live_server_enabled then
      live_server = Job:new({ command = 'live-server' })
      live_server:start()
    else
      -- TODO: Job:shutdown() doesn't kill the job
      -- by itself as of now. This will probably
      -- be fixed later.
      -- https://github.com/nvim-lua/plenary.nvim/issues/156
      live_server:shutdown()
      vim.loop.kill(live_server.pid)
    end
  end,
  color = function()
    local fg = colors.blue
    if live_server_enabled then
      fg = colors.green
    end
    return { fg = fg }
  end,
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
    modified = { fg = colors.orange },
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

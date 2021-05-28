vim.o.showmode = false   -- Do not show modes as the bottom like -- INSERT --
require('lualine').setup{
   options = {
    theme = 'onedark',
    -- section_separators = {'', ''},
    -- component_separators = {'', ''},
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = 1, -- displays icons in alongside component
    -- padding = 1, -- adds padding to the left and right of components
    -- left_padding = 1, -- adds padding to the left of components
    -- right_padding = 1, -- adds padding to the right of components
    -- upper = false, -- displays components in uppercase
    -- lower = false, -- displays components in lowercase
    -- format = nil -- format function, formats component's output
  },
  sections = {
    lualine_a = {
      {
        "mode"
      }
    },
    lualine_b = {
      {
        "branch"
      }
    },
    lualine_c = {
      {
        "filename"
      }
    },
    lualine_x = {
      {
        "encoding"
      },
      {
        "fileformat"
      },
      {
        "filetype",
        colored = true
      },
    },
    lualine_y = {
      {
        'diagnostics',
        -- table of diagnostic sources, available sources:
        -- nvim_lsp, coc, ale, vim_lsp
        sources = {"nvim_lsp"},
        -- displays diagnostics from defined severity
        sections = {'error', 'warn', 'info'},
        -- all colors are in format #rrggbb
        -- color_error = "#ff0000", -- changes diagnostic's error foreground color
        -- color_warn = "#00ff00", -- changes diagnostic's warn foreground color
        -- color_info = "#0000ff", -- Changes diagnostic's info foreground color
        symbols = {error = ' ', warn = ' ', info = ' '}
      },
    },
    lualine_z = {
      {
        "progress"
        -- function ()
        --   return math.floor(vim.fn.line('.') * 100 / vim.fn.line('$')) .. '%%'
        -- end
      },
      {
        "location",
        -- padding = 0,
        -- left_padding = 0,
        -- right_padding = 0,
      },
    },
  },
  tabline = {
    lualine_b = {
      {
        "filename",
        -- file_status = false,
      }
    },
    lualine_x = {
      {
        function () return " " end
      }
    },
    lualine_y = {
      {
        "vim.fn.getcwd()",
      }
    },
  }
}

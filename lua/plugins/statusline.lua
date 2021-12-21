vim.o.showmode = false   -- Do not show modes as the bottom like -- INSERT --
require('lualine').setup{
   options = {
    icons_enabled = true, -- displays icons in alongside component
    disabled_filetypes = {'text', 'NvimTree'},
    theme = 'sonokai',
    section_separators = {left = '', right = ''},
    component_separators = {lef = '', right = ''},
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
         sources = {"nvim_diagnostic"},
         -- displays diagnostics from defined severity
         sections = {'error', 'warn', 'info'},
         -- all colors are in format #rrggbb

         -- diagnostics_color = {
         --   -- Same values like general color option can be used here.
         --   error = 'DiagnosticError', -- changes diagnostic's error color
         --   warn  = 'DiagnosticWarn',  -- changes diagnostic's warn color
         --   info  = 'DiagnosticInfo',  -- changes diagnostic's info color
         --   hint  = 'DiagnosticHint',  -- changes diagnostic's hint color
         -- },

         -- color_error = "#ff6077", -- changes diagnostic's error foreground color
         -- color_warn = "#e7c664", -- changes diagnostic's warn foreground color
         -- color_info = "#85d3f2", -- Changes diagnostic's info foreground color

         symbols = {error = ' ', warn = ' ', info = ' '},
         colored = true,
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
  
   -- Uncomment this, if bufferline is not installed
   -- tabline = {
   --   lualine_b = {
   --     {
   --       "filename",
   --       -- file_status = false,
   --     }
   --   },
   --   lualine_x = {
   --     {
   --       function () return " " end
   --     }
   --   },
   --   lualine_y = {
   --     {
   --       "vim.fn.getcwd()",
   --     }
   --   },
   -- }
}

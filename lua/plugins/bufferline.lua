local colors = {
  black =       '#222222',
  bg0 =         '#2c2e34',
  bg1 =         '#33353f',
  bg2 =         '#363944',
  bg3 =         '#3b3e48',
  bg4 =         '#414550',
  bg_red =      '#ff6077',
  diff_red =    '#55393d',
  bg_green =    '#a7df78',
  diff_green =  '#394634',
  bg_blue =     '#85d3f2',
  diff_blue =   '#354157',
  diff_yellow = '#4e432f',
  fg =          '#e2e2e3',
  red =         '#fc5d7c',
  orange =      '#f39660',
  yellow =      '#e7c664',
  green =       '#9ed072',
  blue =        '#76cce0',
  purple =      '#b39df3',
  grey =        '#7f8490',
  grey_dim =    '#595f6f',
  inactive_tab_bg =   '#23272e',
  inactive_tab_fg = "#999999",
  active_tab_fg = '#e2e2e3',
  active_tab_bg = "#1c1f24",
  none =        'NONE',
}

local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

bufferline.setup {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      close_command = "Bdelete! %d",
      right_mouse_command = "Bdelete! %d",
      buffer_close_icon = "",
      modified_icon = "",
      -- close_icon = "%@NvChad_bufferline_quitvim@%X",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match('%.md') then
          return vim.fn.fnamemodify(buf.name, ':t:r')
        end
      end,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false, -- "or nvim_lsp"
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            else
               return true
            end
         else
            return true
         end
      end,
   },


   highlights = {
      background = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },

      -- buffers
      buffer_selected = {
         guifg = colors.active_tab_fg,
         guibg = colors.active_tab_bg,
         gui = "bold",
      },
      buffer_visible = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },

      -- for diagnostics = "nvim_lsp"
      error = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },
      error_diagnostic = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },

      -- close buttons
      close_button = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },
      close_button_visible = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },
      close_button_selected = {
         guifg = colors.blue,
         guibg = colors.active_tab_bg,
      },
      fill = {
         guifg = colors.inactive_tab_bg,
         guibg = colors.inactive_tab_bg,
      },
      indicator_selected = {
         guifg = colors.blue,
         guibg = colors.active_tab_bg,
      },

      -- modified
      modified = {
         guifg = colors.blue,
         guibg = colors.inactive_tab_bg,
      },
      modified_visible = {
         guifg = colors.blue,
         guibg = colors.inactive_tab_bg,
      },
      modified_selected = {
         guifg = colors.blue,
         guibg = colors.active_tab_bg,
      },

      -- separators
      separator = {
         guifg = colors.inactive_tab_bg,
         guibg = colors.inactive_tab_bg,
      },
      separator_visible = {
         guifg = colors.inactive_tab_bg,
         guibg = colors.inactive_tab_bg,
      },
      separator_selected = {
         guifg = colors.inactive_tab_bg,
         guibg = colors.inactive_tab_bg,
      },
      -- tabs
      tab = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },
      tab_selected = {
         guifg = colors.black,
         guibg = colors.blue,
      },
      tab_close = {
         guifg = colors.blue,
         guibg = colors.black,
      },
      duplicate_selected = {
         guifg = colors.active_tab_fg,
         guibg = colors.active_tab_bg,
         gui = "bold",
      },
      duplicate_visible = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.active_tab_bg,
      },
      duplicate = {
         guifg = colors.inactive_tab_fg,
         guibg = colors.inactive_tab_bg,
      },
   },
}

--  highlights = {
--      fill = {
--          guifg = colors.inactive_tab_bg,
--          guibg = colors.inactive_tab_bg,
--      },
--      background = {
--          guifg = colors.inactive_tab_fg,
--          guibg = colors.inactive_tab_bg,
--      },
--      tab = {
--          guifg = colors.inactive_tab_fg,
--          guibg = colors.inactive_tab_bg,
--      },
--      tab_selected = {
--          guifg = colors.black,
--          guibg = colors.blue,
--      },
--      tab_close = {
--          guifg = colors.blue,
--          guibg = colors.black,
--      },
--      close_button = {
--          guifg = colors.inactive_tab_fg,
--          guibg = colors.inactive_tab_bg,
--      },
--      close_button_visible = {
--          guifg = colors.inactive_tab_fg,
--          guibg = colors.inactive_tab_bg,
--      },
--      close_button_selected = {
--          guifg = colors.blue,
--          guibg = colors.active_tab_bg,
--      },
--      buffer_visible = {
--          guifg = colors.inactive_tab_fg,
--          guibg = colors.inactive_tab_bg,
--      },
--      buffer_selected = {
--          guifg = colors.active_tab_fg,
--          guibg = colors.active_tab_bg,
--          gui = "bold",
--      },
--      diagnostic = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--      },
--      diagnostic_visible = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--      },
--      diagnostic_selected = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--          gui = "bold,italic"
--      },
--      info = {
--          guifg = <color-value-here>,
--          guisp = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      info_visible = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      info_selected = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--          gui = "bold,italic",
--          guisp = <color-value-here>
--      },
--      info_diagnostic = {
--          guifg = <color-value-here>,
--          guisp = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      info_diagnostic_visible = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      info_diagnostic_selected = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--          gui = "bold,italic",
--          guisp = <color-value-here>
--      },
--      warning = {
--          guifg = <color-value-here>,
--          guisp = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      warning_visible = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      warning_selected = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--          gui = "bold,italic",
--          guisp = <color-value-here>
--      },
--      warning_diagnostic = {
--          guifg = <color-value-here>,
--          guisp = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      warning_diagnostic_visible = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      warning_diagnostic_selected = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--          gui = "bold,italic",
--          guisp = warning_diagnostic_fg
--      },
--      error = {
--          guifg = colors.red,
--          guibg = colors.active_tab_bg,
--      },
--      error_visible = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      error_selected = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--          gui = "bold,italic",
--          guisp = <color-value-here>
--      },
--      error_diagnostic = {
--          guifg = colors.inactive_tab_fg,
--          guibg = colors.inactive_tab_bg,
--      },
--      error_diagnostic_visible = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>
--      },
--      error_diagnostic_selected = {
--          guifg = <color-value-here>,
--          guibg = <color-value-here>,
--          gui = "bold,italic",
--          guisp = <color-value-here>
--      },
--      modified = {
--          guifg = colors.blue,
--          guibg = colors.inactive_tab_bg,
--      },
--      modified_visible = {
--          guifg = colors.blue,
--          guibg = colors.inactive_tab_bg,
--      },
--      modified_selected = {
--          guifg = colors.blue,
--          guibg = colors.active_tab_bg,
--      },
--      duplicate_selected = {
--          guifg = '<color-value-here>',
--          gui = "italic",
--          guibg = '<color-value-here>'
--      },
--      duplicate_visible = {
--          guifg = '<color-value-here>',
--          gui = "italic",
--          guibg = '<color-value-here>'
--      },
--      duplicate = {
--          guifg = '<color-value-here>',
--          gui = "italic",
--          guibg = '<color-value-here>'
--      },
--      separator_selected = {
--          guifg = '<color-value-here>,
--          guibg = '<color-value-here>'
--      },
--      separator_visible = {
--          guifg = '<color-value-here>,
--          guibg = '<color-value-here>'
--      },
--      separator = {
--          guifg = '<color-value-here>,
--          guibg = '<color-value-here>'
--      },
--      indicator_selected = {
--          guifg = '<color-value-here>',
--          guibg = '<color-value-here>'
--      },
--      pick_selected = {
--          guifg = '<color-value-here>',
--          guibg = '<color-value-here>',
--          gui = "bold,italic"
--      },
--      pick_visible = {
--          guifg = '<color-value-here>',
--          guibg = '<color-value-here>',
--          gui = "bold,italic"
--      },
--      pick = {
--          guifg = '<color-value-here>',
--          guibg = '<color-value-here>',
--          gui = "bold,italic"
--      }

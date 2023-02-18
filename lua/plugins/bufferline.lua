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

vim.cmd([[
 function! Quit_vim(a,b,c,d)
 qa
 endfunction
]])

bufferline.setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    show_close_icon = false,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    name_formatter = function(buf)
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = false,
    custom_areas = {
      right = function()
        return {
          { text = "%@Quit_vim@  %X" },
        }
      end,
    },
    custom_filter = function(buf_number)
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
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },

    -- buffers
    buffer_selected = {
      fg = colors.active_tab_fg,
      bg = colors.active_tab_bg,
      bold = true
    },
    buffer_visible = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },

    -- for diagnostics = "nvim_lsp"
    error = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },
    error_diagnostic = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },

    -- close buttons
    close_button = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },
    close_button_visible = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },
    close_button_selected = {
      fg = colors.blue,
      bg = colors.active_tab_bg,
    },
    fill = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },
    indicator_selected = {
      fg = colors.blue,
      bg = colors.active_tab_bg,
    },
    indicator_visible = {
      fg = colors.inactive_tab_bg,
      bg = colors.inactive_tab_bg,
    },

    -- modified
    modified = {
      fg = colors.blue,
      bg = colors.inactive_tab_bg,
    },
    modified_visible = {
      fg = colors.blue,
      bg = colors.inactive_tab_bg,
    },
    modified_selected = {
      fg = colors.blue,
      bg = colors.active_tab_bg,
    },

    -- separators
    separator = {
      fg = colors.inactive_tab_bg,
      bg = colors.inactive_tab_bg,
    },
    separator_visible = {
      fg = colors.inactive_tab_bg,
      bg = colors.inactive_tab_bg,
    },
    separator_selected = {
      fg = colors.inactive_tab_bg,
      bg = colors.inactive_tab_bg,
    },
    tab_separator = {
      fg = colors.inactive_tab_bg,
      bg = colors.inactive_tab_bg,
    },
    tab_separator_selected = {
      fg = colors.blue,
      bg = colors.blue,
    },
    -- tabs
    tab = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },
    tab_selected = {
      fg = colors.black,
      bg = colors.blue,
    },
    tab_close = {
      fg = colors.blue,
      bg = colors.black,
    },
    duplicate_selected = {
      fg = colors.active_tab_fg,
      bg = colors.active_tab_bg,
      bold = true
    },
    duplicate_visible = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },
    duplicate = {
      fg = colors.inactive_tab_fg,
      bg = colors.inactive_tab_bg,
    },
  },
}

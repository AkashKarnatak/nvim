local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

vim.cmd([[
 function! Quit_vim(a,b,c,d)
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
}

-- Mappings
vim.api.nvim_set_keymap('n', 'L', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'H', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', ':BufferLineMoveNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-h>', ':BufferLineMovePrev<CR>', {noremap = true, silent = true})

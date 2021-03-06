vim.o.showmode = false
local gl = require("galaxyline")
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
local condition = require("galaxyline.condition")
local buffer = require("galaxyline.provider_buffer")
local lsp = require("galaxyline.provider_lsp")
local gls = gl.section

gl.short_line_list = {
  "NvimTree",
  "packer",
  "netrw",
  "dapui_scopes",
  "dapui_breakpoints",
  "dapui_stacks",
  "dapui_watches",
  "dap-repl",
  "toggleterm",
  "input",
  "output",
  "lspinfo"
}

local function is_not_dashboard()
  local buftype = buffer.get_buffer_filetype()
  return buftype ~= "DASHBOARD"
end

gls.left[1] = {
  RainbowRed = {
    provider = function()
      return "▌ "
    end,
    highlight = { colors.blue, colors.bg },
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      vim.api.nvim_set_hl(0, "GalaxyViMode", { fg = mode_color[vim.fn.mode()] })
      return "  "
    end,
    highlight = { colors.red, colors.bg, "bold" },
  },
}
gls.left[3] = {
  FileSize = {
    provider = "FileSize",
    condition = condition.buffer_not_empty and condition.hide_in_width,
    highlight = { colors.fg, colors.bg },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}
gls.left[4] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty and is_not_dashboard,
    highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg },
  },
}

gls.left[5] = {
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty and is_not_dashboard,
    highlight = { colors.magenta, colors.bg, "bold" },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.left[6] = {
  LineInfo = {
    provider = function()
      local line = vim.fn.line(".")
      local column = vim.fn.col(".")
      return string.format("%d:%d  ", line, column)
    end,
    -- provider = "LineColumn",
    highlight = { colors.fg_alt, colors.bg },
  },
}

gls.left[7] = {
  PerCent = {
    provider = "LinePercent",
    condition = is_not_dashboard,
    highlight = { colors.fg_alt, colors.bg },
    separator = "  ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.left[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    condition = is_not_dashboard,
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    condition = is_not_dashboard,
    icon = "  ",
    highlight = { colors.yellow, colors.bg },
  },
}

gls.left[10] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    condition = is_not_dashboard,
    icon = "  ",
    highlight = { colors.green, colors.bg },
  },
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    condition = is_not_dashboard,
    icon = "  ",
    highlight = { colors.blue, colors.bg },
  },
}

gls.mid[1] = {
  LspProgressInfo = {
    provider = function()
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
          return string.format(" %s %s %s (%s%%) ", success_icon[frame + 1], title, msg, percentage)
        end

        return string.format(" %s %s %s (%s%%) ", spinners[frame + 1], title, msg, percentage)
      end

      return ""
    end,
    highlight = { colors.violet, colors.bg },
  }
}

gls.right[1] = {
  FileEncode = {
    provider = "FileEncode",
    condition = condition.hide_in_width and is_not_dashboard,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.fg, colors.bg, "bold" },
  },
}

gls.right[2] = {
  FileFormat = {
    provider = "FileFormat",
    condition = condition.hide_in_width and is_not_dashboard,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.fg, colors.bg, "bold" },
  },
}

gls.right[3] = {
  ShowLspClient = {
    -- provider = "GetLspClient",
    -- condition = function()
    --   local tbl = { ["dashboard"] = true, [""] = true }
    --   if tbl[vim.bo.filetype] then
    --     return false
    --   end
    --   return true
    -- end,
    -- icon = " LSP:",
    -- highlight = { colors.cyan, colors.bg, "bold" },
    provider = function()
      -- Check if there's a LSP client running to avoid redundant
      -- statusline elements
      if lsp.get_lsp_client() ~= "No Active Lsp" then
        return string.format(" %s   %s ", vim.bo.filetype, lsp.get_lsp_client())
      else
        -- Use the filetype instead
        return string.format(" %s ", vim.bo.filetype)
      end
    end,
    condition = function()
      local tbl = { ["dashboard"] = true, [""] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.blue, colors.bg },
    separator = "  ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.right[4] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = condition.check_git_workspace,
    highlight = { colors.red, colors.bg },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.right[5] = {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    highlight = { colors.green, colors.bg, "bold" },
  },
}

gls.right[6] = {
  DiffSeparator = {
    provider = function()
      return "   "
    end,
    condition = condition.hide_in_width,
    highlight = { colors.bg, colors.bg },
  },
}

gls.right[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.green, colors.bg },
  },
}

gls.right[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = { colors.orange, colors.bg },
  },
}

gls.right[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
}

gls.right[10] = {
  RainbowBlue = {
    provider = function()
      return " ▐"
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.short_line_left[1] = {
  ShortRainbowLeft = {
    provider = function()
      return "▌ "
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.short_line_left[2] = {
  BufferType = {
    provider = "FileTypeName",
    condition = is_not_dashboard,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.blue, colors.bg, "bold" },
  },
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = { colors.fg, colors.bg },
  },
}

gls.short_line_right[2] = {
  ShortRainbowRight = {
    provider = function()
      return " ▐"
    end,
    highlight = { colors.blue, colors.bg },
  },
}

-- =============================================================================
-- Genarated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- =============================================================================
local colors = {
  color4   = "#e2e2e3",
  color5   = "#414550",
  color6   = "#e7c664",
  color7   = "#f39660",
  color8   = "#ff6077",
  color9   = "#85d3f2",
  color10  = "#b39df3",
  color0   = "#7f8490",
  color1   = "#33353f",
  color2   = "#2c2e34",
  color3   = "#a7df78",
}

local sonokai = {
  inactive = {
    a = { fg = colors.color0, bg = colors.color1 , gui = "bold", },
    b = { fg = colors.color0, bg = colors.color1 },
    c = { fg = colors.color0, bg = colors.color1 },
  },
  insert = {
    a = { fg = colors.color2, bg = colors.color3 , gui = "bold", },
    b = { fg = colors.color4, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color1 },
  },
  command = {
    a = { fg = colors.color2, bg = colors.color6 , gui = "bold", },
    b = { fg = colors.color4, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color1 },
  },
  replace = {
    a = { fg = colors.color2, bg = colors.color7 , gui = "bold", },
    b = { fg = colors.color4, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color1 },
  },
  terminal = {
    a = { fg = colors.color2, bg = colors.color8 , gui = "bold", },
    b = { fg = colors.color4, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color1 },
  },
  normal = {
    a = { fg = colors.color2, bg = colors.color9 , gui = "bold", },
    b = { fg = colors.color4, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color1 },
  },
  visual = {
    a = { fg = colors.color2, bg = colors.color10 , gui = "bold", },
    b = { fg = colors.color4, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color1 },
  },
}

return sonokai
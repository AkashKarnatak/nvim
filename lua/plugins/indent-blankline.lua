local ibl = require "ibl"

ibl.setup({
  scope = {
    show_start = true
  },
  exclude = {
    filetypes = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "norg",
      "markdown"
    },
    buftypes = { "terminal", "nofile" }
  }
})

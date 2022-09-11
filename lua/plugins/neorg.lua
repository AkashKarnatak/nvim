require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.export"] = {},
    ["core.norg.concealer"] = {
      config = {
        width = "content"
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.integrations.nvim-cmp"] = {
      config = {}
    },
  }
}

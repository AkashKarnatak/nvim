vim.o.shortmess = vim.o.shortmess .. 'c'

local luasnip = require("luasnip")
local cmp = require'cmp'
require("luasnip/loaders/from_vscode").lazy_load()

--- Wraps nvim_replace_termcodes
--- @param str string
--- @return string
local function replace_termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
--- Helper function to check what <Tab> behaviour to use
--- @return boolean
local function check_backspace()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﴲ",
  Variable = "[]",
  Class = "",
  Interface = "ﰮ",
  Module = "",
  Property = "襁",
  Unit = "",
  Value = "",
  Enum = "練",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "ﲀ",
  Struct = "ﳤ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  completion = {
    keyword_length = 1;
    completeopt = "menuone,noselect",
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snp]",
        buffer = "[Buf]",
        nvim_lua = "[Lua]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
   },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "luasnip" },
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}

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
}

vim.cmd('highlight! CmpItemAbbrMatch           guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemAbbrMatchFuzzy      guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindText            guibg=NONE    guifg=' .. colors.fg)
vim.cmd('highlight! CmpItemKindMethod          guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindFunction        guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindConstructor     guibg=NONE    guifg=' .. colors.red)
vim.cmd('highlight! CmpItemKindField           guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemKindVariable        guibg=NONE    guifg=' .. colors.green)
vim.cmd('highlight! CmpItemKindClass           guibg=NONE    guifg=' .. colors.magenta)
vim.cmd('highlight! CmpItemKindInterface       guibg=NONE    guifg=' .. colors.yellow)
vim.cmd('highlight! CmpItemKindModule          guibg=NONE    guifg=' .. colors.magenta)
vim.cmd('highlight! CmpItemKindProperty        guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindUnit            guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindValue           guibg=NONE    guifg=' .. colors.red)
vim.cmd('highlight! CmpItemKindEnum            guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemKindKeyword         guibg=NONE    guifg=' .. colors.green)
vim.cmd('highlight! CmpItemKindSnippet         guibg=NONE    guifg=' .. colors.magenta)
vim.cmd('highlight! CmpItemKindColor           guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindFile            guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindReference       guibg=NONE    guifg=' .. colors.red)
vim.cmd('highlight! CmpItemKindFolder          guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemKindEnumMember      guibg=NONE    guifg=' .. colors.green)
vim.cmd('highlight! CmpItemKindConstant        guibg=NONE    guifg=' .. colors.magenta)
vim.cmd('highlight! CmpItemKindStruct          guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindEvent           guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindOperator        guibg=NONE    guifg=' .. colors.red)
vim.cmd('highlight! CmpItemKindTypeParameter   guibg=NONE    guifg=' .. colors.orange)

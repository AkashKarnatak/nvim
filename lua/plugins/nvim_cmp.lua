vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt = "menuone,noselect"

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'

local kinds = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "ﰕ",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "廓",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

vim.g.vsnip_append_final_tabstop = false

cmp.setup {
  preselect = cmp.PreselectMode.None,
  completion = {
    keyword_length = 2;
    completeopt = "menuone,noselect",
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.menu = vim_item.kind
      -- vim_item.menu = string.format("%s %s", vim_item.kind, ({
      --   nvim_lsp = "[LSP]",
      --   vsnip = "[VSnip]",
      --   buffer = "[Buffer]",
      --   nvim_lua = "[NvimLua]",
      --   path = "[Path]",
      -- })[entry.source.name])
      vim_item.kind = kinds[vim_item.kind]
      return vim_item
    end,
  },
  window = {
    documentation = {
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
    },
    completion = {
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
    },
  },
  sources = {
    { name = 'vsnip' },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "neorg" },
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<M-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#jumpable"](1) == 1 then
        feedkey("<Plug>(vsnip-jump-next)", "")
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      elseif cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),
  },
}

local colors = {
  bg = "#23272e",
  fg = "#bbc2cf",
  fg_alt = "#747c84",
  yellow = "#ECBE7B",
  cyan = "#46D9FF",
  green = "#98be65",
  orange = "#da8548",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ff6c6b",
}

vim.cmd('highlight! CmpItemAbbrMatch        gui=bold   guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemAbbrMatchFuzzy   gui=underline   guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindText            guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemKindMethod          guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindFunction        guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindConstructor     guibg=NONE    guifg=' .. colors.yellow)
vim.cmd('highlight! CmpItemKindField           guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindVariable        guibg=NONE    guifg=' .. colors.green)
vim.cmd('highlight! CmpItemKindClass           guibg=NONE    guifg=' .. colors.yellow)
vim.cmd('highlight! CmpItemKindInterface       guibg=NONE    guifg=' .. colors.yellow)
vim.cmd('highlight! CmpItemKindModule          guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindProperty        guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindUnit            guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindValue           guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemKindEnum            guibg=NONE    guifg=' .. colors.yellow)
vim.cmd('highlight! CmpItemKindKeyword         guibg=NONE    guifg=' .. colors.magenta)
vim.cmd('highlight! CmpItemKindSnippet         guibg=NONE    guifg=' .. colors.green)
vim.cmd('highlight! CmpItemKindColor           guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindFile            guibg=NONE    guifg=' .. colors.blue)
vim.cmd('highlight! CmpItemKindReference       guibg=NONE    guifg=' .. colors.red)
vim.cmd('highlight! CmpItemKindFolder          guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemKindEnumMember      guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindConstant        guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemKindStruct          guibg=NONE    guifg=' .. colors.yellow)
vim.cmd('highlight! CmpItemKindEvent           guibg=NONE    guifg=' .. colors.cyan)
vim.cmd('highlight! CmpItemKindOperator        guibg=NONE    guifg=' .. colors.red)
vim.cmd('highlight! CmpItemKindTypeParameter   guibg=NONE    guifg=' .. colors.orange)
vim.cmd('highlight! CmpItemMenu                guibg=NONE    guifg=' .. colors.fg_alt)
vim.cmd('highlight! CmpPmenu guifg=#bbc2cf guibg=#282c34')
vim.cmd('highlight! CmpPmenuBorder guifg=#5f5f5f guibg=#282c34')

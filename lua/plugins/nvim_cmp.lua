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

vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. '/lua/plugins/snippets'
vim.g.vsnip_append_final_tabstop = false

cmp.setup {
  preselect = cmp.PreselectMode.None,
  completion = {
    keyword_length = 1;
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
    { name = 'vsnip', keyword_pattern = '\\%([^[:alnum:][:blank:]]\\|\\w\\+\\)' },
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

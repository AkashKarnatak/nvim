local M = {}

M.setup = function()
  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      border = "rounded",
      source = "always",
    },
  }

  vim.diagnostic.config(config)

  -- Default border style
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
end

local lsp_keymaps = function(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gk", "K", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-n>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.keymap.set("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { buffer = bufnr, noremap = true, desc = "Toggle inlay hints", silent = true })
  vim.keymap.set("n", "<leader>ll", function()
    if vim.diagnostic.is_enabled() then
      vim.diagnostic.enable(false)
    else
      vim.diagnostic.enable(true)
    end
  end, { buffer = bufnr, noremap = true, desc = "Toggle diagnostics", silent = true })
  vim.api.nvim_set_keymap(
    "n",
    "k",
    [[(v:count > 1 ? "m'" . v:count : '') . 'k']],
    { expr = true, noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
end

M.on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
    vim.lsp.inlay_hint.enable(false)
  else
    local cfg = require("plugins.lsp_signature")
    require("lsp_signature").on_attach(cfg, bufnr)
  end
  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities()
M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = false

return M

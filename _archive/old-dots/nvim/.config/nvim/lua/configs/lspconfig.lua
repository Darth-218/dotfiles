local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = vim.lsp.config
local util = require("lspconfig/util")

local servers = { "html", "cssls", "eslint", "gopls", "pyright", "nil_ls", "clangd", "dartls", "ts_ls" }

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end


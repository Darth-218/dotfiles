require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
--
-- ~/.config/nvim/lua/custom/configs/lspconfig.lua
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.gopls.setup({})

-- TypeScript/JavaScript configuration
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--   root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
--   settings = {
--     typescript = {
--       inlayHints = {
--         includeInlayParameterNameHints = "all",
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--     javascript = {
--       inlayHints = {
--         includeInlayParameterNameHints = "all",
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--   },
-- }

-- ESLint configuration
lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
}

-- Tailwind CSS (for Next.js)
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html" },
  root_dir = util.root_pattern("tailwind.config.js", "postcss.config.js"),
}

-- read :h vim.lsp.config for changing options of lsp servers

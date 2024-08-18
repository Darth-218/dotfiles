return {

  {
    "williamboman/mason.nvim",

    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
	ensure_installed = {
	  "clangd",
	  "omnisharp",
	  "lua_ls",
	  "gopls",
	  "pyright",
	}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.csharp_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
	  client.server_capabilities.signatureHelpProvider = false
	  on_attach(client, bufnr)
	end,
	capabilities = capabilities
      })
    end
  },
}

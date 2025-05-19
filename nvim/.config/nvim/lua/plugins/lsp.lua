-- Automatically ends certain structures

return {

  {
    "tpope/vim-endwise"
  },

  -- LSP's, linters, formatters

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
	  "jdtls",
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
      lspconfig.texlab.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.csharp_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.jdtls.setup({})
      -- lspconfig.typescript_language_server.setup({})
      lspconfig.clangd.setup({
	filetypes = {"cpp", "c", "h", "tpp"},
	capabilities = capabilities,
	vim.filetype.add({
	  extension = {
	    tpp = "cpp",
	  },
	})
      })
    end
  },

  -- Provides automatic file formatting

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
	sources = {
	  null_ls.builtins.formatting.black,
	  null_ls.builtins.formatting.clang_format,
	  null_ls.builtins.formatting.lua_format,
	},
	on_attach = function(client, bufnr)
	  if client.supports_method("textDocument/formatting") then
	    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	    vim.api.nvim_create_autocmd("BufWritePre", {
	      group = augroup,
	      buffer = bufnr,
	      callback = function()
		vim.lsp.buf.format({ buffer = bufnr })
	      end,
	    })
	  end
	end,
      })
    end,
  },

  -- Better diagnostic apperance

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
	preset = "minimal"
      })
    end
  },

  -- Shows LSP diagnostic in a seperate buffer

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Easier work with LaTeX

  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_compiler_latexmk = { aux_dir = '.tex_aux/' }
    end
  },

  {
    "mfussenegger/nvim-jdtls"
  },

  {
    "kmonad/kmonad-vim"
  },
}

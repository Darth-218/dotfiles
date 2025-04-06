-- Provides live HTML, CSS and Javascript editing

return {
  {
    "ray-x/web-tools.nvim",
    config = function()
      require("web-tools").setup({})
    end,
  },

  -- Provides basic git functionality

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- provides code snippets

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp"
  },

  -- Provides autocompletion

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",   -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind.nvim",       -- vs-code like pictograms
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
	completion = {
	  completeopt = "menu,menuone,preview,noselect",
	},
	snippet = { -- configure how nvim-cmp interacts with snippet engine
	  expand = function(args)
	    luasnip.lsp_expand(args.body)
	  end,
	},
	mapping = cmp.mapping.preset.insert({
	  ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
	  ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
	  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
	  ["<C-f>"] = cmp.mapping.scroll_docs(4),
	  ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
	  ["<C-e>"] = cmp.mapping.abort(),    -- close completion window
	  ["<CR>"] = cmp.mapping.confirm(),
	}),
	-- window = {
	-- completion = cmp.config.window.bordered({
	-- border = "double",
	-- winhighlight = "Normal:TabLineFill,FloatBorder:DiffDelete,CursorLine:CursorLineNr,Search:None",
	-- },),
	-- },
	-- sources for autocompletion
	sources = cmp.config.sources({
	  { name = "nvim_lsp" },
	  { name = "nvim_lsp_signature_help" },
	  { name = "luasnip" }, -- snippets
	  { name = "buffer" },
	  { name = "path" },
	}),
	formatting = {
	  format = lspkind.cmp_format({
	    maxwidth = 50,
	    ellipsis_char = "...",
	  }),
	},
      })
    end,
  },

  -- Takes a screenshot of the current buffer

  {

    "michaelrommel/nvim-silicon",

    lazy = true,
    cmd = "Silicon",

    config = function()
      require("silicon").setup({
	font = "Monocraft=34",
	-- theme = "catppuccin",
	no_window_controls = true,
	pad_vert = 0,
	pad_horiz = 0,

      })
    end
  },

  -- To be found

  {"nvim-lua/plenary.nvim"},

  -- Allows commenting lines through bindings

  {
    "tpope/vim-commentary",
  },

  -- {
  --   "Raimondi/delimitMate",
  -- },

  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      image = {
	enabled = false,
	latex = {
	  font_size = "10pt"
	}
      }
    }
  }
}

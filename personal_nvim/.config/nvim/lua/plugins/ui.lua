return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
      -- require("bufferline").setup{}
    end
  }, {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {"SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons"},
    opts = {}
  }, {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufEnter",
    opts = {
      draw = {delay = 60, priority = 3},
      mappings = {
	object_scope = "ii",
	object_scope_with_border = "ai",
	goto_top = "[i",
	goto_bottom = "]i"
      },
      options = {
	border = "both",
	indent_at_cursor = true,
	try_as_border = false
      },
      symbol = "┃"
    }
  },
  -- TODO:
  -- WARN:
  -- PERF:
  -- NOTE:
  -- TEST:
  {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
	FIX = {
	  icon = "",
	  color = "error",
	  alt = {"FIXME", "BUG", "FIXIT", "ISSUE"}
	},
	MARK = {icon = "󰟙", color = "mark"},
	TODO = {icon = "", color = "info"},
	HACK = {icon = "", color = "warning"},
	WARN = {
	  icon = "",
	  color = "warning",
	  alt = {"WARNING", "XXX"}
	},
	PERF = {
	  icon = "",
	  alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}
	},
	NOTE = {icon = "", color = "hint", alt = {"INFO"}},
	TEST = {
	  icon = "󰙨",
	  color = "test",
	  alt = {"TESTING", "PASSED", "FAILED"}
	}
      },
      gui_style = {fg = "NONE", bg = "BOLD"},
      merge_keywords = true,
      highlight = {
	multiline = true,
	multiline_pattern = "^.",
	multiline_context = 10,
	before = "",
	keyword = "wide",
	after = "fg",
	pattern = [[.*<(KEYWORDS)\s*:]],
	comments_only = true,
	max_line_len = 400,
	exclude = {}
      },
      colors = {
	mark = {"", "#e46876"},
	error = {"DiagnosticError", "ErrorMsg", "#DC2626"},
	warning = {"DiagnosticWarn", "WarningMsg", "#FBBF24"},
	info = {"DiagnosticInfo", "#2563EB"},
	hint = {"DiagnosticHint", "#10B981"},
	default = {"Identifier", "#7C3AED"},
	test = {"Identifier", "#FF00FF"}
      },
      search = {
	command = "rg",
	args = {
	  "--color=never", "--no-heading", "--with-filename",
	  "--line-number", "--column"
	},
	pattern = [[\b(KEYWORDS):]]
      }
    }

  }, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
	ensure_installed = {
	  "c", "c_sharp", "cpp", "python", "lua", "markdown",
	  "markdown_inline", "latex", "vim", "query", "javascript",
	  "html", "norg", "gleam", "yuck", "go", "nu", "java"
	},
	sync_install = true,
	highlight = {enable = true},
	indent = {enable = true}
      })
    end
  }, {
    "folke/zen-mode.nvim",
    opts = {
      window = {width = .5, options = {number = true}},
      plugins = {gitsigns = {enabled = true}, lualine = {enabled = true}}
    }
  }, {
    "hat0uma/csvview.nvim",
    opts = {
      parser = {comments = {"#", "//"}},
      keymaps = {
	textobject_field_inner = {"if", mode = {"o", "x"}},
	textobject_field_outer = {"af", mode = {"o", "x"}},
	jump_next_field_end = {"<Tab>", mode = {"n", "v"}},
	jump_prev_field_end = {"<S-Tab>", mode = {"n", "v"}},
	jump_next_row = {"<Enter>", mode = {"n", "v"}},
	jump_prev_row = {"<S-Enter>", mode = {"n", "v"}}
      }
    },
    cmd = {"CsvViewEnable", "CsvViewDisable", "CsvViewToggle"}
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lualine').setup{
	-- options = { theme = 'palenight' }
      }
    end,
  },
  {"mechatroner/rainbow_csv"},
  {'xiyaowong/transparent.nvim'},
  {"norcalli/nvim-colorizer.lua"},
  {"shortcuts/no-neck-pain.nvim", version = "*"}
}

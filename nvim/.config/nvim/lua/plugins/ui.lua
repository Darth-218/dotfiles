-- Provides buffer breadcrumbs

return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {},
  },

  -- Colors the background of hex color codes

  {
    "norcalli/nvim-colorizer.lua",
  },

  -- Provides a customizable bufferline

  {
    'nvim-lualine/lualine.nvim',

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {
      options = {
	icons_enabled = false,
	component_separators = { left = '', right = ''},
	section_separators = { left = '', right = ''},
	theme = {
	  normal = {
	    a = {fg = "#080808", bg = "#a3ace1"},
	    b = {
	      fg = "#bcbcbc",
	      bg = "#191724",
	      buffers_color = {
		active = {
		  fg = "#e3ab5d"
		},
	      },
	    },
	    inactive = {
	      a = {fg = "#bcbcbc", bg = "#080808"},
	    },
	  },
	},
      },
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
	statusline = 1000,
	tabline = 1000,
	winbar = 1000,
      },
      sections = {
	lualine_a = {'location'},
	lualine_b = {'buffers'},
	lualine_c = {''},
	lualine_x = {''},
	lualine_y = {''},
	lualine_z = {''}
      },
      inactive_sections = {
	lualine_a = {'filename'},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {}
      },
    },
  },

  -- Provides scope indicators

  {

    "echasnovski/mini.indentscope",
    version = false,

    event = "BufEnter",

    opts = {
      draw = {
	delay = 60,

	priority = 3,
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
	-- Textobjects
	object_scope = "ii",
	object_scope_with_border = "ai",

	-- Motions (jump to respective border line; if not present - body line)
	goto_top = "[i",
	goto_bottom = "]i",
      },

      -- Options which control scope computation
      options = {
	-- Type of scope's border: which line(s) with smaller indent to
	-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
	border = "both",

	-- Whether to use cursor column when computing reference indent.
	-- Useful to see incremental scopes with horizontal cursor movements.
	indent_at_cursor = true,

	-- Whether to first check input line to be a border of adjacent scope.
	-- Use it if you want to place cursor on function header to get scope of
	-- its body.
	try_as_border = false,
      },

      -- Which character to use for drawing scope indicator
      symbol = "┃",
    },
  },

  -- Makes active buffer centered 

  {
    "shortcuts/no-neck-pain.nvim", version = "*"
  },

  -- Creates colored delimiters depending on the depth

  {

    "HiPhish/rainbow-delimiters.nvim",

    config = function()

      require("rainbow-delimiters.setup").setup({

	highlight = {

	  'RainbowDelimiterBlue',
	  'RainbowDelimiterOrange',
	  'RainbowDelimiterGreen',
	  'RainbowDelimiterViolet',
	  'RainbowDelimiterCyan',
	  'RainbowDelimiterYellow',
	  'RainbowDelimiterRed',
	},})
    end,
  },

  -- Provides comment "tags"

  -- TODO: 
  -- WARN:
  -- PERF:
  -- NOTE:
  -- TEST:

  {

    "folke/todo-comments.nvim",

    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {

      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
	FIX = {
	  icon = "", -- icon used for the sign, and in search results
	  color = "error", -- can be a hex color, or a named color (see below)
	  alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
	  -- signs = false, -- configure signs for some keywords individually
	},
	MARK = { icon = "󰟙", color = "mark" },
	TODO = { icon = "", color = "info" },
	HACK = { icon = "", color = "warning" },
	WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
	PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
	NOTE = { icon = "", color = "hint", alt = { "INFO" } },
	TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
	fg = "NONE", -- The gui style to use for the fg highlight group.
	bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
	multiline = true, -- enable multine todo comments
	multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
	multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
	before = "", -- "fg" or "bg" or empty
	keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
	after = "fg", -- "fg" or "bg" or empty
	pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
	comments_only = true, -- uses treesitter to match keywords in comments only
	max_line_len = 400, -- ignore lines longer than this
	exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
	mark = { "", "#e46876"};
	error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
	warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
	info = { "DiagnosticInfo", "#2563EB" },
	hint = { "DiagnosticHint", "#10B981" },
	default = { "Identifier", "#7C3AED" },
	test = { "Identifier", "#FF00FF" }
      },
      search = {
	command = "rg",
	args = {
	  "--color=never",
	  "--no-heading",
	  "--with-filename",
	  "--line-number",
	  "--column",
	},
	-- regex that will be used to match keywords.
	-- don't replace the (KEYWORDS) placeholder
	pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    }

  },

  -- Treesitter

  {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
	  ensure_installed = {
	    "c",
	    "c_sharp",
	    "cpp",
	    "python",
	    "lua",
	    "markdown",
	    "markdown_inline",
	    "latex",
	    "vim",
	    "query",
	    "javascript",
	    "html",
	    "norg",
	    "gleam",
	    "yuck",
	    "go",
	    "nu",
	    "java",
	  },
	  sync_install = true,
	  highlight = { enable = true },
	  indent = { enable = true },
	})
      end,
    },
  },

  -- Makes the buffer *zenful*

  {

    "folke/zen-mode.nvim",

    opts = {

      window = {

	width = .5,

	options = {

	  number = true,
	},
      },

      plugins = {

	gitsigns = { enabled = true },
	lualine = { enabled = true },

      },
    },
  },

  {
    "mechatroner/rainbow_csv"
  },

{
  "hat0uma/csvview.nvim",
  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
    parser = { comments = { "#", "//" } },
    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      -- Excel-like navigation:
      -- Use <Tab> and <S-Tab> to move horizontally between fields.
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}}

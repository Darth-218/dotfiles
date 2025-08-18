-- Allows quick navigation inside buffer

return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- Provides faster navigaition in buffer

  {

    'phaazon/hop.nvim',

    config = function()
      require("hop").setup()
    end
  },

  -- Provides file tree

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  -- An alternative file browser

  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      autosave_changes = true,
      default_file = true,
      columns = { "icon", "permissions", "size" },
      keymaps = {
	["H"] = "actions.parent",
	["L"] = "actions.select",
	["q"] = "actions.close",
	["<Esc>"] = "actions.close",
      },
      view_options = {
	show_hidden = true,
      },
      float = {
	padding = 5,
	max_height = 25,
	max_width = 80,
	win_options = {
	  winblend = 5,
	},
      },
    },
  },

  -- Adds a fuzzy finder

  {
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.6",

      dependancies = { "nvim-lua/plenary.nvim" },
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",

      config = function()
	require("telescope").setup({
	  pickers = {
	    find_files = {
	      "fd",
	      ".",
	      "--type",
	      "file",
	      "--hidden",
	      "--strip-cwd-prefix",
	    },
	  },
	})
	extensions = {
	  ["ui-select"] = {
	    require("telescope.themes").get_ivy({}),
	  },
	}
	-- require("telescope").load_extension("ui-select")
      end,
    },
  },

  -- Allows seemless navigation between tmux and nvim

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },
}

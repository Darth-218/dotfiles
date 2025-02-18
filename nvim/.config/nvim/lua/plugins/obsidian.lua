return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ui = {
      enable = false
    },
    workspaces = {
      {
	name = "personal",
	path = "~/the-duat/Notes/",
      },
      {
	name = "uni",
	path = "~/the-duat/Notes/01_college/",
      },
    -- {
    --   name = "no-vault",
    --   path = function()
    --     -- alternatively use the CWD:
    --     -- return assert(vim.fn.getcwd())
    --     return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
    --   end,
    --   overrides = {
    --     notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
    --     new_notes_location = "current_dir",
    --     templates = {
    --       folder = vim.NIL,
    --     },
    --     disable_frontmatter = true,
    --   },
    -- },
  },
    note_frontmatter_func = function()
      return {}
    end,
  },
}

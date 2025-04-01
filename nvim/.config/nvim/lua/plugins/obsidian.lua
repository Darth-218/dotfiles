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
  },
    note_frontmatter_func = function()
      return {}
    end,
  },
}

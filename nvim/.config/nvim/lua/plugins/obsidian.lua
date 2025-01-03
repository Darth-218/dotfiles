return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    templates = {
      folder = "~/.config/nvim/lua/plugins/obsidian-temps",
    },
    workspaces = {
      {
        name = "personal",
        path = "~/the-duat/Notes",
      },
    },
  },
    init = function()
    	vim.opt.conceallevel = 2
    end,
}

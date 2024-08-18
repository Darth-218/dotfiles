return {
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
}

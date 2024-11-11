return {
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
        },
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

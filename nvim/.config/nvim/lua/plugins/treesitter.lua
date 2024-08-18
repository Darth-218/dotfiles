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
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "norg",
          "org",
          "gleam",
          "yuck",
          "go",
        },
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

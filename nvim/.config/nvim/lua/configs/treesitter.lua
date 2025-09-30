local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "c", "cpp", "python", "lua", "markdown",
    "latex", "vim", "typescript", "tsx",
    "html", "go", "java"
  },
  sync_install = true,
  highlight = { enable = true },
  indent = { enable = true }
})

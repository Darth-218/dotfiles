require("options.lazy")
require("options.keymaps")

vim.o.shiftwidth = 2

Tmux = function()
  vim.cmd.TmuxNavigateDown()
  vim.cmd.TmuxNavigateUp()
end

Tmux()

vim.cmd.colorscheme("mellifluous")

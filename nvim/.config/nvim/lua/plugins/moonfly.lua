return {

  "bluz71/vim-moonfly-colors",

  name = "moonfly",
  lazy = false,
  priority = 1000,

  config = function()

    vim.api.nvim_set_hl(0, "LineNr", {fg="#80A0FF", bold = true})

  end
}

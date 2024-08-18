return {

  "michaelrommel/nvim-silicon",

  lazy = true,
  cmd = "Silicon",

  config = function()
    require("silicon").setup({
      font = "Firacode NF=34;Noto Color Emoji=34",
      theme = "moonfly",
      no_window_controls = true,
      pad_vert = 0,
      pad_horiz = 0,

    })
  end
}

local logo = [[


  ██╗   ██╗██╗███╗   ███╗
  ██║   ██║██║████╗ ████║
  ██║   ██║██║██╔████╔██║
  ╚██╗ ██╔╝██║██║╚██╔╝██║
   ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═══╝  ╚═╝╚═╝     ╚═╝


          ]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

return {

	"nvimdev/dashboard-nvim",

	event = "VimEnter",

	config = function()
		require("dashboard").setup({

			theme = "hyper",
			shortcut_type = "letter",

			preview = { file_path = true },

			config = {

				header = vim.split(logo, "\n"),

				project = { enabled = true, limit = 2 },
				mru = { limit = 5 },

				shortcut = {

					{ desc = "󰤘 Recent-Files", action = "Telescope oldfiles theme=ivy", key = "r" },
					{ desc = "󰈔 Files", action = "Telescope find_files theme=ivy hidden=true", key = "f" },
					{ desc = " Git-Files", action = "Telescope git_files theme=ivy", key = "g" },
					{ desc = " Find-In-File", action = "Telescope live_grep theme=ivy", key = "l" },
					{
						desc = "Restore Session",
						action = [[<cmd>lua require("persistence").load({ last = true })<cr>]],
						key = "s",
					},
					{ desc = "󰈆 Quit", action = ":q", key = "q" },
				},
				footer = { " " },
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

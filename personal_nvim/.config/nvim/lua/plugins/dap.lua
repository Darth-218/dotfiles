return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      dap.adapters.python = {
	type = "executable",
	command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
	args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
	{
	  type = "python",
	  request = "launch",
	  name = "Debug Python",
	  program = "${file}",
	  pythonPath = vim.fn.exepath("python3"),
	},
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
      end
    end,
  },
}

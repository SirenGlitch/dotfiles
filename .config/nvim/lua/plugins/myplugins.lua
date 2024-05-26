local plugins = {
  {
    "thinca/vim-quickrun",
    event = "BufRead"
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      config = function ()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialised["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end
    }
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end
  },
  {
   "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "yaml-language-server", "pyright",
        "dockerfile-language-server", "bash-language-server", "debugpy",
        "bash-debug-adapter", "stylua", "prettier", "marksman"
      },
    },
  },

}
return plugins

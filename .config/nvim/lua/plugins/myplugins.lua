local plugins = {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Run LazyGit" },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    ft = "rust",
    opts = function()
      return require "custom.configs.rustaceanvim"
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "zeioth/none-ls-autoload.nvim",
    event = "BufEnter",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
      "zeioth/none-ls-external-sources.nvim",
    },
    opts = function()
      return require "configs.none-ls-autoload"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    event = "BufWritePre",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "is0n/jaq-nvim",
    event = "BufRead",
    config = function()
      require "configs.jaq-nvim"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "folke/lazydev.nvim",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      require("lazydev").setup {
        library = { "nvim-dap-ui" },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_)
      require "configs.dap-mappings"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require "configs.dap-mappings"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "echasnovski/mini-git",
    version = false,
    main = "mini.git",
    event = "BufRead",
    config = function()
      require("mini.git").setup()
    end,
  },
}
return plugins

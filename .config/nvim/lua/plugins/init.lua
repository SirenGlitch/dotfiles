return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
   {
     "neovim/nvim-lspconfig",
     config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
     end,
   },

   -- Moved to myplugins.lua to follow intended syntax
   -- {
   	-- "williamboman/mason.nvim",
   	-- opts = {
   		-- ensure_installed = {
   			-- "lua-language-server", "yaml-language-server", "pyright",
        -- "dockerfile-language-server", "bash-language-server", "debugpy",
        -- "bash-debug-adapter", "stylua", "prettier", "marksman"
   		-- },
   	-- },
   -- },

   {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "python"
 	  	},
   	},
   },
}

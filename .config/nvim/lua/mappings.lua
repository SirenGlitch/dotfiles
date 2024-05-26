require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- QuickRun on F5
map("n", "<F5>", "<cmd>QuickRun<CR>", {desc = "Run the current buffer"})

-- DAP mappings
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
map("n", "<leader>dpr", function()
  require('dap-python').test_method()
  end
)

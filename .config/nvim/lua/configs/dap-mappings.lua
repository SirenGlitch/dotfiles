local map = vim.keymap.set

map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Debug Breakpoint current line" })
map("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "Debug Start debugging" })

map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Debug Python test closest method" })

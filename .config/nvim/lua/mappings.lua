require "nvchad.mappings"
require "configs.lazy-mappings"

-- add yours here

local map = vim.keymap.set

-- QuickRun on F5
map("n", "<F5>", "<cmd>Jaq<CR>", { desc = "Run the current buffer" })

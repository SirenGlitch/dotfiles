require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- QuickRun on F5
map("n", "<F5>", "<cmd>QuickRun<CR>", {desc = "Run the current buffer"})

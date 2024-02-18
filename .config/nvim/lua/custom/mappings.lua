local M = {}

M.general ={
  n = {
    -- QuickRun on F5
    ["<F5>"] = { ":QuickRun<CR>", "Run the current buffer", opts= { noremap = true, silent = true } }
  }
}

return M

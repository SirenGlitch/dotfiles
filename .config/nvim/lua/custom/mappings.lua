local map = vim.keymap.set

local mappings = {
  n = {
    -- QuickRun on F5
    ["<F5>"] = { ":QuickRun<CR>", "Run the current buffer", opts= { noremap = true, silent = true } }
  },
}

for mode, maps in pairs(mappings) do
  for key, val in pairs(maps) do
    map(mode, key, val[1], val[2])
  end
end

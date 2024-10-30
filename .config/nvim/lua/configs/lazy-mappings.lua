local map = vim.keymap.set

local function opts(desc)
  return { desc = "Lazy " .. desc }
end

map("n", "<leader>Ls", "<cmd>Lazy sync<cr>", opts "sync")
map("n", "<leader>Lh", "<cmd>Lazy home<cr>", opts "home")
map("n", "<leader>Lx", "<cmd>Lazy clean<cr>", opts "clean unneeded packages")
map("n", "<leader>Lr", "<cmd>Lazy restore<cr>", opts "restore to Lockfile")

local plugins = {
  {
    "williamboman/mason.nvim",
    lazy = false
  },
  {
    "thinca/vim-quickrun",
    event = "BufRead"
  }
}
return plugins

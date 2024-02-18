local plugins = {
  {
    "thinca/vim-quickrun",
    event = "BufRead"
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  }
}
return plugins

local configs = require "nvchad.configs.lspconfig"

local servers = {
  pyright = {},
  dockerls = {},
  bashls = {},
  yamlls = {},
  marksman = {},
  -- rust_analyzer = {
  -- settings = {
  -- ["rust-analyzer"] = {
  -- imports = {
  -- granularity = {
  -- group = "module",
  -- },
  -- prefix = "self",
  -- },
  -- cargo = {
  -- allFeatures = true,
  -- buildScripts = {
  -- enable = true,
  -- },
  -- },
  -- procMacro = {
  -- enable = true,
  -- },
  -- },
  -- },
  -- },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

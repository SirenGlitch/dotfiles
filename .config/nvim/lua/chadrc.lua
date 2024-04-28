---@type ChadrcConfig
local M = {}

M.ui = {
  theme='catppuccin',

  hl_override = {

    St_pos_text = {
      fg = "lightbg",
      bg = "green",
    },
    St_cwd_text = {
      fg = "lightbg",
      bg = "red",
    },
  },

  statusline = {
    modules = {
      cwd = function()
        local icon = "%#St_cwd_icon#" .. "󰉋 "
        local name = vim.loop.cwd()
        return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. "" .. icon .. name .. "%#St_cwd_sep#" .. "")) or ""
      end,

      cursor = function()
       return "%#St_pos_sep#" .. "" .. "%#St_pos_icon# %#St_pos_text# %p %% " .. "%#St_pos_sep#" .. ""
      end
    },
  },
}

return M

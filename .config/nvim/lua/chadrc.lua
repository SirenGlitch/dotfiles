---@type ChadrcConfig
local M = {}

M.ui = {
  ---------------- Base46 ----------------
  theme='catppuccin',
  -- hl = highlights
  hl_override = {

    St_pos_text = {
      fg = "lightbg",
      bg = "green",
    },
    St_pos_sep = {
      fg = "green",
      bg = "statusline_bg",
    },
    St_cwd_icon = {
      fg = "lightbg",
      bg = "red"
    },
    St_cwd_text = {
      fg = "lightbg",
      bg = "red",
    },
    St_cwd_sep = {
      fg = "red",
      bg = "statusline_bg"
    },
  },
  ---------- Nvchad_ui modules -----------
  statusline = {
    modules = {
      cwd = function()
        local icon = "%#St_cwd_icon#" .. " "
        local name = vim.loop.cwd()
        name = "%#St_cwd_text#" .. name
        return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. "" .. icon .. name .. "%#St_cwd_sep#" .. "")) or ""
      end,

      cursor = function()
       return "%#St_pos_sep#" .. "" .. "%#St_pos_icon# %#St_pos_text# %p %% " .. "%#St_pos_sep#" .. ""
      end
    },
  },
}

return M

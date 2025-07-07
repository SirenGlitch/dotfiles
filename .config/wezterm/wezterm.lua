local appearance = require("appearance")
-- local keys = require("keys")
local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.tiling_desktop_environments = {
	"Wayland",
}
appearance.apply_to_config(config)
-- keys.apply_to_config(config)

return config

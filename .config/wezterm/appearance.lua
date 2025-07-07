local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	local function parse_json(data)
		local result = wezterm.serde.json_decode(data)
		return result
	end

	local function read_json(file)
		local f = assert(io.open(file, "rb"))
		local body = f:read("*all")
		f:close()
		return parse_json(body)
	end
	local pywal_colors_path = os.getenv("HOME") .. "/.cache/wal/colors.json"
	local pywal_colors = read_json(pywal_colors_path)

	local function hex2rgba(hex, alpha)
		hex = hex:gsub("#", "")
		local r = tonumber(hex:sub(1, 2), 16)
		local g = tonumber(hex:sub(3, 4), 16)
		local b = tonumber(hex:sub(5, 6), 16)
		return string.format("rgba(%s,%s,%s,%s)", r, g, b, alpha)
	end

	wezterm.add_to_config_reload_watch_list("/home/frazer/.cache/wal/colors.json")

	config.window_close_confirmation = "AlwaysPrompt"
	config.window_decorations = "NONE"

	config.tab_max_width = 50
	config.scrollback_lines = 3000
	config.front_end = "OpenGL"

	config.window_background_opacity = 0.85
	config.font = wezterm.font_with_fallback({
		{
			family = "JetBrainsMono Nerd Font",
			-- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
			weight = "Medium",
		},
		{
			family = "Symbols Nerd Font",
			scale = 1.0,
			weight = "Regular",
		},
		{
			family = "Noto Sans CJK JP",
			scale = 1.2,
		},
		"Noto Color Emoji",
	})
	config.font_size = 11
	config.use_fancy_tab_bar = false
	config.enable_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = true

	config.default_cursor_style = "BlinkingBlock"
	config.cursor_blink_ease_in = "Constant"
	config.cursor_blink_ease_out = "Constant"
	config.cursor_blink_rate = 750

	config.enable_kitty_graphics = true

	config.force_reverse_video_cursor = true

	config.colors = {
		split = pywal_colors.colors.color1,
		tab_bar = {
			background = hex2rgba(pywal_colors.special.background, 0.80),
			active_tab = {
				bg_color = pywal_colors.colors.color14,
				fg_color = pywal_colors.special.background,
				intensity = "Bold",
				underline = "None",
				italic = true,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = pywal_colors.special.background,
				fg_color = pywal_colors.colors.color14,
				italic = false,
				strikethrough = true,
			},
			inactive_tab_hover = {
				bg_color = pywal_colors.colors.color8,
				fg_color = pywal_colors.colors.color0,
				italic = false,
			},
			new_tab = {
				bg_color = pywal_colors.special.background,
				fg_color = pywal_colors.colors.color14,
			},
			new_tab_hover = {
				bg_color = pywal_colors.colors.color14,
				fg_color = pywal_colors.special.background,
			},
		},
	}

	--	wezterm.on("update-status", function(window, pane)
	--		local cwd = pane:get_current_working_dir().file_path
	--		local time = wezterm.strftime("%a %b %-d %I:%M %p")
	--
	--		window:set_right_status(wezterm.format({
	--			{ Background = { Color = hex2rgba(wallust_colors.special.background, 0.9) } },
	--			{ Foreground = { Color = wallust_colors.colors.color1 } },
	--			{ Text = "" },
	--			{ Background = { Color = wallust_colors.colors.color1 } },
	--			{ Foreground = { Color = wallust_colors.colors.color12 } },
	--			{ Text = " " .. wezterm.nerdfonts.custom_folder_open },
	--			{ Text = " ~" },
	--			{ Text = cwd .. " " },
	--			{ Foreground = { Color = wallust_colors.colors.color14 } },
	--			{ Text = "" },
	--			{ Background = { Color = wallust_colors.colors.color14 } },
	--			{ Foreground = { Color = wallust_colors.special.background } },
	--			{ Text = " " .. wezterm.nerdfonts.fa_calendar .. " " .. time .. " " },
	--		}))
	--	end)

	wezterm.on("toggle-background", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		if not overrides.window_background_opacity then
			overrides.window_background_opacity = 1.0
		else
			overrides.window_background_opacity = nil
		end
		window:set_config_overrides(overrides)
	end)

	config.inactive_pane_hsb = {
		saturation = 0.7,
		brightness = 0.5,
	}
end

return module

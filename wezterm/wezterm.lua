local wezterm = require("wezterm")

return {
	window_padding = {
		left = 15,
		right = 15,
		top = 10,
		bottom = 0,
	},

	color_scheme = "Catppuccin",
	window_background_opacity = 0.6,
	window_decorations = "RESIZE",
	enable_tab_bar = true,
	scrollback_lines = 5000,
	enable_scroll_bar = false,
	check_for_updates = false,
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 500,

	-- font = wezterm.font("RecMonoCasual Nerd Font", { weight = "Bold", style = "Italic" }),
	font = wezterm.font("RecMonoCasual Nerd Font", { weight = "Bold" }),
	font_size = 14.0,

	keys = {
		{
			key = "L",
			mods = "CTRL|SHIFT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "H",
			mods = "CTRL|SHIFT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		-- Command + Shift + H 切换到前一个tab标签
		{
			key = "H",
			mods = "CMD|SHIFT",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		-- Command + Shift + H 切换到后一个tab标签
		{
			key = "L",
			mods = "CMD|SHIFT",
			action = wezterm.action.ActivateTabRelative(1),
		},
	},
}

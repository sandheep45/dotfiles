local wezterm = require("wezterm")
local fancy_nav_bar = require("tab-bar/fancy-tab-bar")
-- local retro_nav_bar = require("tab-bar/retro-tab-bar")

local module = {}
function module.apply_to_config(config)
	-- config.hide_tab_bar_if_only_one_tab = true
	-- config.use_fancy_tab_bar = true
	config.tab_bar_at_bottom = false
	config.window_padding = {
		left = 2,
		right = 2,
		top = 10,
		bottom = 0,
	}
	config.inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	}

	fancy_nav_bar.apply_to_config(config)
	-- retro_nav_bar.apply_to_config(config)
end

-- return our module table
return module

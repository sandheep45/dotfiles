local wezterm = require("wezterm")

local module = {}
function module.apply_to_config(config)
	config.font = wezterm.font("LigaCartographCF Nerd Font", { weight = "Light", stretch = "Normal", style = "Italic" })
	config.font = wezterm.font("LigaInputMono Nerd Font", { weight = 275, stretch = "Normal", style = "Normal" })
	config.font_size = 17.0
	config.cell_width = 1.0
	config.line_height = 1.0
end

-- return our module table
return module

local wezterm = require 'wezterm'
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local fonts = {
    iosevka_term = wezterm.font("IosevkaTerm Nerd Font", { weight = "Regular" }),
    iosevka = wezterm.font("Iosevka Nerd Font", { weight = "Regular" }),
    source_code_pro = wezterm.font("SauceCodePro Nerd Font", { weight = "Regular" }),
    jetbrains = wezterm.font "JetBrainsMono Nerd Font", 
}

local cached_colors = {
    n = "nord",
    b = "Batman",
    trf = "terafox",
    hlk = "The Hulk",
    tokyo_m = "tokyonight_moon",
    tmrw_bl = "Tomorrow Night Blue",
    tmrw_brn = "Tomorrow Night Burns",
    tch = "ToyChest",
    at = "AdventureTime",
}
local colorize = cached_colors.tokyo_m

config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

config.font_size = 16.0
config.font = fonts.jetbrains

config.color_scheme = colorize
config.default_cwd = os.getenv("HOME")
config.audible_bell = "Disabled"
config.use_dead_keys = false
config.keys = {
-- override tab motion (similar to Iterm2 defaults)
	{
	    key = "LeftArrow",
	    mods = "SUPER",
	    action = wezterm.action({ ActivateTabRelative = -1 }),
	},
	{
	    key = "RightArrow",
	    mods = "SUPER",
	    action = wezterm.action({ ActivateTabRelative = 1 }),
	},

	-- trying to utilize vim movement shceme
	{
	    key = "H",
	    mods = "CTRL|SHIFT",
	    action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},
	{
	    key = "L",
	    mods = "CTRL|SHIFT",
	    action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},
	{
	    key = "K",
	    mods = "CTRL|SHIFT",
	    action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},
	{
	    key = "J",
	    mods = "CTRL|SHIFT",
	    action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},

	{
	    key = "Q",
	    mods = "CTRL|SHIFT",
	    action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
	},
}

return config

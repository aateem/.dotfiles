local wezterm = require("wezterm")

return {
    default_cwd = os.getenv("HOME"),
    color_scheme = "nord",
    font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Regular" }),
    font_size = 16.0,
    audible_bell = "Disabled",
    use_dead_keys = false,
    keys = {
        -- override tab motion (similar to Iterm2 defaults)
        { key = "LeftArrow", mods = "SUPER", action = wezterm.action { ActivateTabRelative = -1 } },
        { key = "RightArrow", mods = "SUPER", action = wezterm.action { ActivateTabRelative = 1 } },

        -- trying to utilize vim movement shceme
        { key = "H", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "L", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "K", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "J", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Down" } },

        { key = "Q", mods = "CTRL|SHIFT", action = wezterm.action { CloseCurrentPane = { confirm = true } } }
    },
}

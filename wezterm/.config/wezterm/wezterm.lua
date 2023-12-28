local wezterm = require("wezterm")
local act = wezterm.action

if wezterm.config_builder then
    config = wezterm.config_builder()
end

local fonts = {
    iosevka_term = wezterm.font("IosevkaTerm Nerd Font", { weight = "Medium" }),
    iosevka = wezterm.font("Iosevka Nerd Font", { weight = "Regular" }),
    source_code_pro = wezterm.font("SauceCodePro Nerd Font", { weight = "Regular" }),
    jetbrains = wezterm.font("JetBrainsMono Nerd Font"),
}

local cached_colors = {
    at = "AdventureTime",
    ayu = "Ayu Light (Gogh)",
    b = "Batman",
    dracula = "Dracula (Official)",
    hlk = "The Hulk",
    n = "nord",
    nord = "Nord (Gogh)",
    tch = "ToyChest",
    tmrw_bl = "Tomorrow Night Blue",
    tmrw_brn = "Tomorrow Night Burns",
    tokyo_day = "tokyonight_day",
    tokyo_m = "tokyonight_moon",
    trf = "terafox",
}
local colorize = cached_colors.nord

config.font = fonts.iosevka_term
config.color_scheme = colorize

config.show_update_window = true
config.window_frame = { font_size = 14.0 }
config.command_palette_font_size = 16.0
config.font_size = 18.0
config.default_cwd = os.getenv("HOME")
config.audible_bell = "Disabled"
config.use_dead_keys = false
config.colors = { compose_cursor = "orange" }

-- TODO
-- config.mouse_bindings = {
--     -- Ctrl-click will open the link under the mouse cursor
--     {
--         event = { Up = { streak = 1, button = "Left" } },
--         mods = "CTRL",
--         action = wezterm.action.OpenLinkAtMouseCursor,
--     },
-- }

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    -- override tab motion (similar to Iterm2 defaults)
    { key = "LeftArrow", mods = "SUPER", action = act({ ActivateTabRelative = -1 }) },
    { key = "RightArrow", mods = "SUPER", action = act({ ActivateTabRelative = 1 }) },
    -- panes
    {
        key = "|",
        mods = "LEADER|SHIFT",
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
    { key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
    { key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },
    { key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
    { key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
    { key = "q", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
    {
        key = "r",
        mods = "LEADER",
        action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
    },
    -- tabs
    {
        key = "t",
        mods = "LEADER",
        action = act.ActivateKeyTable({ name = "move_tabs", one_shot = false }),
    },
    -- workspace
    { key = "s", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
    { key = "n", mods = "LEADER", action = act.SwitchWorkspaceRelative(1) },
    { key = "p", mods = "LEADER", action = act.SwitchWorkspaceRelative(-1) },
}

config.key_tables = {
    move_tabs = {
        { key = "h", action = act.MoveTabRelative(-1) },
        { key = "l", action = act.MoveTabRelative(1) },
        { key = "Escape", action = "PopKeyTable" },
    },
    resize_pane = {
        { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
        { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },

        { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
        { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

        { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
        { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

        { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
        { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

        { key = "Escape", action = "PopKeyTable" },
    },
}

wezterm.on("update-right-status", function(window, pane)
    local sep = " " .. "/" .. " "

    local compose = ""
    if window:active_key_table() then
        compose = wezterm.nerdfonts.fa_keyboard_o .. "   " .. window:active_key_table()
    end
    if window:leader_is_active() then
        compose = "LEADER"
    end

    local wsp = window:active_workspace()
    local date_and_time = wezterm.strftime("%Y-%m-%d %H:%M")

    window:set_right_status(wezterm.format({
        { Foreground = { Color = "orange" } },
        { Text = compose },
        "ResetAttributes",
        { Text = sep },
        { Text = "wsp:" },
        { Foreground = { Color = "cyan" } },
        { Text = wsp },
        "ResetAttributes",
        { Text = sep },
        { Text = date_and_time },
        { Text = sep },
    }))
end)

return config

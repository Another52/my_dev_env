-- variables
local opacity = 0.4
local incDelta = 0.2
--

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- shortcut keys
config.keys = {
    {
        key = "UpArrow",
        mods = "SHIFT",
        action = wezterm.action.EmitEvent("inc-opacity"),
    },
    {
        key = "DownArrow",
        mods = "SHIFT",
        action = wezterm.action.EmitEvent("dec-opacity"),
    }
}

-- window decor
config.color_scheme = 'Atom'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = opacity

config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
    active_titlebar_bg = string.format("rgba(0 0 0 %f)", opacity),
    inactive_titlebar_bg = string.format("rgba(0 0 0 %f)", opacity),
}
 

-- Functions
function setOpacityDelta()
    if (opacity > 0.9) then
        incDelta = 0.03
    elseif (opacity > 0.7) then
        incDelta = 0.05
    elseif (opacity > 0.5) then
        incDelta = 0.08
    else
        incDelta = 0.2
    end
end
wezterm.on("inc-opacity", function(window, pane)
    setOpacityDelta()
    opacity = math.max(0.0, opacity - incDelta)

    local overrides = window:get_config_overrides() or {}
        overrides.window_background_opacity = opacity
    window:set_config_overrides(overrides)
end)

wezterm.on("dec-opacity", function(window, pane)
    setOpacityDelta()
    opacity = math.min(1.0, opacity + incDelta)

    local overrides = window:get_config_overrides() or {}
        overrides.window_background_opacity = opacity
    window:set_config_overrides(overrides)
end)

-- Linux: launch ZSH
if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
    config.default_prog = { 'zsh' }
end

-- Windows: launch MSYS2 Clang64 via cmd.exe
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_cwd = "D:/Code"
    config.default_prog = {
        'cmd.exe', '/k',
        'C:/msys64/msys2_shell.cmd -defterm -here -no-start -clang64 -shell zsh'
    }
end

return config

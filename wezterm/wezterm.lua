local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- shortcut keys
config.keys = {
    {
        key = "O",
        mods = "CTRL|SHIFT",
        action = wezterm.action.EmitEvent("toggle-opacity"),
    },
}

-- window decor
config.color_scheme = 'Afterglow'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 0.7

wezterm.on("toggle-opacity", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
        overrides.window_background_opacity = 0.97
    else
        overrides.window_background_opacity = nil
    end
    window:set_config_overrides(overrides)
end)

-- Windows: launch MSYS2 Clang64 via cmd.exe
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_cwd = "D:/Code"
    config.default_prog = {
        'cmd.exe', '/k',
        'C:/msys64/msys2_shell.cmd -defterm -here -no-start -clang64 -shell bash'
    }
end

return config

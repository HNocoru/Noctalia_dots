-- CachyOS Hyprland Configuration
-- This file is a pure composition root: it only orders requires, no logic lives here.
--
-- Load order rule: tokens (colors, variables) always first, because everything
-- else may reference their globals (CACHYLGREEN, MONITOR1, TERMINAL, etc).
-- Beyond that, default domains are independent of each other and can load in
-- any order — grouped here by layer only for readability.
--
-- custom/<same path>.lua overrides/extends its config/<same path>.lua
-- counterpart. Safe to omit any custom file; safe_require just skips it.

local function safe_require(mod)
    local ok, err = pcall(require, mod)
    if not ok then
        -- Only swallow "module not found" errors (file doesn't exist).
        -- Any other error (a real syntax/runtime bug in the file) should
        -- surface normally instead of failing silently.
        if not tostring(err):find("module '" .. mod .. "' not found", 1, true) then
            error(err)
        end
    end
end

------------------------------------------------------------
-- DEFAULT CONFIGURATION (config/) — do not edit these files.
-- Put your changes in the matching custom/ file instead.
------------------------------------------------------------

-- Tokens (must load first)
require("config.tokens.colors")
require("config.tokens.variables")

-- System
require("config.system.environment")
require("config.system.autostart")
require("config.system.inputs")

-- Appearance
require("config.appearance.animations")
require("config.appearance.decorations")

-- Binds
require("config.binds.window")
require("config.binds.launcher")
require("config.binds.hardware")
require("config.binds.utilities")
require("config.binds.workspace")
require("config.binds.plugins")
require("config.binds.voxtype")
require("config.binds.gpu")

-- Behavior
require("config.behavior.misc")
require("config.behavior.windowrules.floating")
require("config.behavior.windowrules.gaming")
require("config.behavior.windowrules.apps")
require("config.behavior.windowrules.opacity")
require("config.behavior.windowrules.fixes")

-- Layout
require("config.layout.monitors")
require("config.layout.workspaces")

------------------------------------------------------------
-- CUSTOM OVERRIDES (custom/) — this is where YOUR config lives.
-- Each file below is optional; nothing breaks if it doesn't exist.
------------------------------------------------------------

safe_require("custom.tokens.colors")
safe_require("custom.tokens.variables")

safe_require("custom.system.environment")
safe_require("custom.system.autostart")
safe_require("custom.system.inputs")

safe_require("custom.appearance.animations")
safe_require("custom.appearance.decorations")

safe_require("custom.binds.window")
safe_require("custom.binds.launcher")
safe_require("custom.binds.hardware")
safe_require("custom.binds.utilities")
safe_require("custom.binds.workspace")

safe_require("custom.behavior.misc")
-- "layerrules" no tiene contraparte en config/ porque no había reglas de
-- capa por defecto que heredar (ver custom/behavior/layerrules.lua para el
-- porqué). Es la única línea nueva que se agregó a este composition root.
safe_require("custom.behavior.layerrules")
safe_require("custom.behavior.windowrules.floating")
safe_require("custom.behavior.windowrules.gaming")
safe_require("custom.behavior.windowrules.apps")
safe_require("custom.behavior.windowrules.opacity")
safe_require("custom.behavior.windowrules.fixes")

safe_require("custom.layout.monitors")
safe_require("custom.layout.workspaces")

------------------------------------------------------------
-- nwg-displays support (kept as-is from the original config)
------------------------------------------------------------
local function file_exists(path)
    local f = io.open(path, "r")
    if f then f:close() return true end
    return false
end

if file_exists(os.getenv("HOME") .. "/.config/hypr/workspaces.lua") then
    require("workspaces")
end
if file_exists(os.getenv("HOME") .. "/.config/hypr/monitors.lua") then
    require("monitors")
end


-- For Noctalia Color templates
require("noctalia").apply_theme()

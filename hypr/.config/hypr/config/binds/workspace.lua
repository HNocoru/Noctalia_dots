local mainMod = "SUPER"

-------------------------------
---- WORKSPACES & MONITORS ----
-------------------------------

-- Focus on monitors
hl.bind(mainMod .. " + 1", hl.dsp.focus({ monitor = MONITOR1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ monitor = MONITOR2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ monitor = MONITOR3 }))

-- Focus on workspace number
-- Absolute
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.focus({ workspace = i }))
end
-- Relative
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.focus({ workspace = "m~" .. i }))
end

-- Move to adjacent workspaces and next empty on a given monitor
hl.bind(mainMod .. " + CONTROL + Right",       hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + Left",        hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + Down",        hl.dsp.focus({ workspace = "emptym" }))

-- Scroll through existing workspaces & monitors
hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + mouse_up",   hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m+1" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + ALT + S",      hl.dsp.window.move({ workspace = "special:special" }))
hl.bind("CONTROL + " .. mainMod .. " + S", hl.dsp.workspace.toggle_special("special"))

-- WayScriber
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("wayscriber --daemon-toggle"))


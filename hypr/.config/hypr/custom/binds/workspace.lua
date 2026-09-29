local mainMod = "SUPER"

-- Adopted from end4: focus workspace N within the current monitor's group
-- of 10 (see custom/tokens/variables.lua for workspace_in_group / WORKSPACE_GROUP_SIZE).
-- This combo (SUPER + plain digit) is unused in Noctalia's default binds, so
-- it doesn't collide with the existing SUPER+ALT+digit (absolute focus) or
-- SUPER+CONTROL+digit (relative focus) binds.
for i = 1, 10 do
    hl.bind(mainMod .. " + " .. (i % 10), function()
        hl.dispatch(hl.dsp.focus({ workspace = workspace_in_group(i) }))
    end, { description = "Workspace: Focus " .. i .. " (grupo del monitor activo)" })
end


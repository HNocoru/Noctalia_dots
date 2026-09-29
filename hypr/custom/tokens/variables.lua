-- Adopted from end4 (illogical-impulse dots-hyprland): hyprland/lib/init.lua + hyprland/variables.lua
--
-- Workspace addressing model: each monitor "owns" a block of 10 workspaces.
-- Monitor 1 = workspaces 1-10, monitor 2 = 11-20, etc. workspace_in_group(i)
-- resolves "the i-th workspace of whichever monitor group I'm currently on".
--
-- This is a DIFFERENT model from Noctalia's default (relative "m~i" per
-- monitor). Both can coexist because they're bound to different key combos:
-- see custom/binds/workspace.lua for the SUPER+<digit> binds that use this.

WORKSPACE_GROUP_SIZE = 10

function workspace_in_group(i)
    local curr = hl.get_active_workspace().id
    local newVal = math.floor((curr - 1) / WORKSPACE_GROUP_SIZE) * WORKSPACE_GROUP_SIZE + i
    return newVal
end

-- Adopted from end4 (hyprland/variables.lua): apps that Noctalia's default
-- tokens (TERMINAL/FILE_MANAGER/BROWSER/EDITOR/CALCULATOR) don't cover.
--
-- These are plain fallback chains (app1 || app2 || app3), not calls to
-- end4's launch_first_available.sh — that script lives in end4's own
-- hyprland/scripts/ folder, which this Noctalia setup doesn't have, so we
-- don't depend on it.
OFFICE_SOFTWARE = "bash -c 'wps || onlyoffice-desktopeditors || libreoffice'"
VOLUME_MIXER    = "bash -c 'pavucontrol-qt || pavucontrol'"


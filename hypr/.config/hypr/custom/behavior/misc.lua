-- Adopted from end4 (hyprland/general.lua). Solo claves que Noctalia no
-- define en ningún lado (config/appearance/decorations.lua ya tiene su
-- propio "general" con gaps_in/gaps_out/border_size/col — no se toca).
--
-- vrr, enable_swallow y swallow_regex NO se copian de end4: Noctalia ya trae
-- su propio valor (distinto pero ya "implementado"), tocarlo sería revertir
-- una configuración que ya funciona, no agregar algo que falta.

hl.config({
    general = {
        no_focus_fallback = true,
        allow_tearing = true, -- necesario para que la regla "immediate" de fixes.lua funcione
        gaps_workspaces = 50,
        snap = {
            enabled = true,
            window_gap = 4,
            monitor_gap = 5,
            respect_gaps = true,
        },
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        on_focus_under_fullscreen = 2,
        allow_session_lock_restore = true,
        session_lock_xray = true,
        initial_workspace_tracking = false,
        focus_on_activate = true,
    },
    binds = {
        scroll_event_delay = 0,
        -- Corrección de Workspace Special: al cambiar de workspace normal,
        -- el scratchpad se oculta en vez de quedar "pegado" encima.
        hide_special_on_workspace_change = true,
    },
})

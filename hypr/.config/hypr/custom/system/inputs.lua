-- Adopted from end4 (hyprland/general.lua). NO se copia kb_layout: end4 trae
-- "us" a fuego, pero eso es una preferencia regional del dueño original de
-- esos dotfiles, no una "funcionalidad faltante" — forzarlo podría romper
-- tu distribución de teclado real. Si usas layout distinto a "us", esta es
-- la clave que tocarías tú mismo (input.kb_layout) cuando quieras.

hl.config({
    input = {
        numlock_by_default = true,
        repeat_delay = 250,
        repeat_rate = 35,
        follow_mouse = 1,
        off_window_axis_events = 2,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.7,
        },
    },

    -- Noctalia ya tiene los binds de zoom (SUPER+Minus/Plus, config/binds/window.lua)
    -- pero nunca afinó la calidad del zoom del cursor.
    cursor = {
        zoom_rigid = false,
        zoom_disable_aa = true,
        hotspot_padding = 1,
    },
})

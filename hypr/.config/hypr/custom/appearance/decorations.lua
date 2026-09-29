-- Adopted from end4 (hyprland/general.lua). Solo se agregan claves que
-- config/appearance/decorations.lua NO define todavía (rounding_power, dim
-- de ventanas inactivas, sombra, calidad del blur). No se tocan gaps_in,
-- gaps_out, border_size, rounding, active/inactive_opacity, blur.size ni
-- blur.passes — esos ya están afinados en config/ y cambiarlos sería alterar
-- algo que ya funciona, no agregar algo que falta.

hl.config({
    decoration = {
        -- 2 = círculo, más alto = squircle
        rounding_power = 2.5,

        -- Dim de ventanas inactivas (end4 lo trae, Noctalia no lo define)
        dim_inactive = true,
        dim_strength = 0.05,

        shadow = {
            enabled = true,
            range = 20,
            offset = { 0, 2 },
            render_power = 10,
            color = "rgba(00000020)",
        },

        blur = {
            enabled = true,
            xray = true,
            new_optimizations = true,
            brightness = 1,
            noise = 0.05,
            contrast = 0.89,
            vibrancy = 0.5,
            vibrancy_darkness = 0.5,
            popups = false,
            popups_ignorealpha = 0.6,
            input_methods = true,
            input_methods_ignorealpha = 0.8,

            -- Corrección de Workspace Special pedida por el usuario: el
            -- scratchpad no debe verse con blur/acrílico, solo tocamos esta
            -- clave puntual (decoration.blur.special), el resto de blur
            -- (size=6, passes=4) sigue viniendo de config/ sin cambios.
            special = false,
        },
    },
})

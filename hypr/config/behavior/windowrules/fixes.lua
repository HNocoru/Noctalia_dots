-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Sin sombra en ventanas ancladas (tiled)
hl.window_rule({match = {float = 0 }, no_shadow = true})

-- Mover el diálogo de progreso de copiado de Dolphin
hl.window_rule({match = {title = "^(Copying — Dolphin)$" }, move = {40, 80}})

-- Compartir pantalla: flotante, anclado y posicionado abajo-centro
hl.window_rule({match = {title = ".*is sharing (a window|your screen).*" }, float = true, pin = true})
hl.window_rule({match = {title = ".*is sharing (a window|your screen).*" }, move = {"(monitor_w*.5-window_w*.5)", "(monitor_h-window_h-12)"} })

-- Tearing/immediate para juegos (reduce input lag en fullscreen)
hl.window_rule({match = {title = ".*\\.exe" }, immediate = true})
hl.window_rule({match = {title = ".*minecraft.*" }, immediate = true})
hl.window_rule({match = {class = "^(steam_app).*" }, immediate = true})


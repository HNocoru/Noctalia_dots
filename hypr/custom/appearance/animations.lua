-- Adopted from end4 (hyprland/general.lua): curvas y leaves de animación que
-- Noctalia no define por defecto. config/appearance/animations.lua ya cubre
-- "global", "windows", "workspaces" y "specialWorkspaceIn/Out" con un modelo
-- más simple (un leaf padre + spring). Aquí solo se agregan los leaves HIJOS
-- que end4 sí afina por separado (windowsIn/windowsOut/windowsMove, fade,
-- layers, border, zoom) — en Hyprland, un leaf hijo (p.ej. "windowsIn") no
-- reemplaza al padre ("windows"), solo lo refina, así que esto convive sin
-- pisar lo que ya está en config/.
--
-- specialWorkspaceIn/Out SÍ se sobreescribe a propósito: la corrección de
-- Workspace Special pedida por el usuario adopta el estilo exacto de end4
-- (slidevert + curvas emphasized) en vez del "slide top/bottom" por defecto
-- de Noctalia.

-- Curvas nuevas (solo las que usan los leaves de abajo; no se copian curvas
-- de end4 que ningún leaf usa, para no dejar código muerto)
hl.curve("emphasizedDecel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1} } })
hl.curve("emphasizedAccel", { type = "bezier", points = { {0.3, 0},   {0.8, 0.15} } })
hl.curve("standardDecel",   { type = "bezier", points = { {0, 0},     {0, 1} } })
hl.curve("menu_decel",      { type = "bezier", points = { {0.1, 1},   {0, 1} } })
hl.curve("menu_accel",      { type = "bezier", points = { {0.52, 0.03}, {0.72, 0.08} } })
hl.curve("stall",           { type = "bezier", points = { {1, -0.1},  {0.7, 0.85} } })

-- Windows (refinamiento del leaf "windows" ya definido en config/)
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3,  bezier = "emphasizedDecel", style = "popin 80%" })
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 3,  bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 2,  bezier = "emphasizedDecel", style = "popin 90%" })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 2,  bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3,  bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "emphasizedDecel" })

-- Layers (paneles/menús flotantes — Noctalia no define ningún leaf "layers*")
hl.animation({ leaf = "layersIn",     enabled = true, speed = 2.7, bezier = "emphasizedDecel", style = "popin 93%" })
hl.animation({ leaf = "layersOut",    enabled = true, speed = 2.4, bezier = "menu_accel",       style = "popin 94%" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 0.5, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut",enabled = true, speed = 2.7, bezier = "stall" })

-- Zoom (Noctalia ya tiene los binds SUPER+Minus/Plus en config/binds/window.lua
-- pero nunca definió cómo se anima el zoom del cursor)
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 3, bezier = "standardDecel" })

-- Workspace Special: corrección pedida — reemplaza el estilo por defecto de
-- Noctalia (slide top/bottom + "quick") por el de end4 (slidevert + curvas
-- emphasized), que es el que ya se usaba antes de migrar.
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 2.8, bezier = "emphasizedDecel", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.2, bezier = "emphasizedAccel", style = "slidevert" })

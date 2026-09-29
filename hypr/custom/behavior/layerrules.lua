-- Adopted from end4 (hyprland/rules.lua) — SOLO la parte de layer_rules.
--
-- end4 define decenas de layer_rules para namespaces de Quickshell/AGS
-- (quickshell:bar, sideleft, sideright, dock[0-9]*, cheatsheet[0-9]*,
-- overview[0-9]*, walker, etc). Noctalia usa su propio shell en QML con
-- namespaces de capa distintos que todavía no hemos revisado a fondo (eso
-- queda pendiente, como quedamos, para cuando veamos la documentación de
-- Noctalia con calma). Esas reglas NO se portan: no hay equivalente directo
-- conocido todavía y adivinar el namespace exacto podría no aplicarse a
-- nada o aplicarse al layer equivocado.
--
-- Lo que sí se porta es lo que es genérico o ya depende de herramientas que
-- este setup ya usa, sin necesidad de saber cómo se llama el shell de Noctalia:

-- xray en todas las capas (mejora cómo se ve el blur de fondo en paneles/menús)
hl.layer_rule({ match = { namespace = ".*" }, xray = true })

-- hyprpicker: Noctalia YA lo usa (SUPER + P en config/binds/utilities.lua)
hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })

-- Convenciones de namespace genéricas y comunes a varias herramientas,
-- no atadas a Quickshell/AGS
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })
hl.layer_rule({ match = { namespace = "osk" }, no_anim = true })
hl.layer_rule({ match = { namespace = "noanim" }, no_anim = true })

-- GTK layer-shell (usado por varias apps GTK para popups/menús, sin
-- depender de qué shell/bar esté corriendo)
hl.layer_rule({ match = { namespace = "gtk-layer-shell" }, blur = true })
hl.layer_rule({ match = { namespace = "gtk-layer-shell" }, ignore_alpha = 0 })
-- Lanzadores necesitan sentirse instantáneos
hl.layer_rule({ match = { namespace = "gtk4-layer-shell" }, no_anim = true })

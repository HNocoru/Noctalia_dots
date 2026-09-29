-- Adopted from end4 (hyprland/rules.lua). config/behavior/windowrules/apps.lua
-- y floating.lua ya cubren dolphin, org.kde.ark, satty, calculadora,
-- launchers, .exe, org.pulseaudio.pavucontrol, nm-connection-editor, etc.
-- Aquí solo se agrega lo que NO estaba: apps que reportan su clase distinto
-- (pavucontrol "a secas", no "org.pulseaudio.pavucontrol"), componentes KDE
-- adicionales (dado que ya usan Dolphin/Ark, es coherente sumar el resto de
-- kcm_*/plasmawindowed/bluedevilwizard), y apps sueltas de end4 que no
-- estorban si no están instaladas (Zotero, Warp, guifetch, blueberry).

hl.window_rule({ match = { class = "^(blueberry\\.py)$" }, float = true })
hl.window_rule({ match = { class = "^(guifetch)$" }, float = true }) -- FlafyDev/guifetch

-- pavucontrol puede reportar su clase como "pavucontrol" en vez de
-- "org.pulseaudio.pavucontrol" (que es la que ya cubre config/); esta regla
-- es el complemento, no un duplicado.
hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true, center = true, size = { "monitor_w*0.45", "monitor_h*0.45" } })

hl.window_rule({ match = { class = ".*plasmawindowed.*" }, float = true })
hl.window_rule({ match = { class = "kcm_.*" }, float = true })
hl.window_rule({ match = { class = ".*bluedevilwizard" }, float = true })
hl.window_rule({ match = { class = "org.freedesktop.impl.portal.desktop.kde" }, float = true, size = { "monitor_w*0.60", "monitor_h*0.65" } })

hl.window_rule({ match = { class = "^(Zotero)$" }, float = true, size = { "monitor_w*0.45", "monitor_h*0.45" } })
hl.window_rule({ match = { class = "^dev\\.warp\\.Warp$" }, tile = true })

-- Adopted from end4 (hyprland/keybinds.lua, sección "Apps"). Antes de portar
-- cada bind se verificó contra TODOS los binds ya activos en config/binds/*
-- para no pisar nada. Resultado:
--
--   Terminal (SUPER+Return), FileManager (SUPER+E), Browser (SUPER+W),
--   TaskManager (CONTROL+SHIFT+Escape -> terminal + btop) ya son idénticos
--   entre end4 y Noctalia. No se tocan.
--
--   SUPER+C y SUPER+T en end4 son "Code editor" y "Terminal" respectivamente;
--   en Noctalia SUPER+C ya es Calculadora y SUPER+T ya es tu EDITOR. Es un
--   choque real de esquema de teclas, no algo que se pueda resolver
--   automáticamente sin decidir cuál flujo prefieres — se deja indicado
--   aquí en vez de remapear algo que ya usas.
--
--   SUPER+X en end4 es "Text editor"; en Noctalia SUPER+X ya es
--   "panel-toggle control-center". También en conflicto, mismo motivo.
--
-- Lo que SÍ se agrega son combinaciones que están libres en Noctalia:

local mainMod = "SUPER"
local noctCall = "noctalia msg "

-- SUPER+I en end4 abre su panel de ajustes (Quickshell settings.qml /
-- systemsettings / gnome-control-center). El equivalente real en Noctalia
-- es su propio panel de ajustes, que ya existe con SUPER+Z. Este bind solo
-- te da el mismo resultado con la tecla de end4, sin duplicar lógica.
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(noctCall .. "settings-toggle"), { description = "App: Settings (equivalente a end4 SUPER+I)" })

-- Estas dos no tenían ningún equivalente en Noctalia (ni la app ni el bind):
hl.bind("CONTROL + " .. mainMod .. " + SHIFT + ALT + W", hl.dsp.exec_cmd(OFFICE_SOFTWARE), { description = "App: Office software" })
hl.bind("CONTROL + " .. mainMod .. " + V", hl.dsp.exec_cmd(VOLUME_MIXER), { description = "App: Volume mixer" })

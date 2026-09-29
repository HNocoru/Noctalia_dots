local mainMod = "SUPER"
local noctCall = "noctalia msg "

-------------------
---- UTILITIES ----
-------------------

-- Color picker rápido (independiente del toolkit)
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a -n"))

-- Captura rápida de región (acceso directo sin abrir el panel)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(noctCall .. "screenshot-region"))

-- Captura rápida de pantalla completa
hl.bind("Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen pick"))

-- Copiar región de la ventana activa directo al portapapeles sin editor
hl.bind(mainMod .. " + ALT + Print", hl.dsp.exec_cmd("grim -g \"$(hyprctl activewindow -j | jq -r '\"\\(.at[0]),\\(.at[1]) \\(.size[0])x\\(.size[1])\"')\" - | wl-copy"))

-- NOTA: ventana específica, grabación (región/fullscreen), OCR, QR, color
-- picker avanzado, palette, lens, measure — todo esto vive ya en el panel
-- de Screen Toolkit (SUPER+SHIFT+O, definido en plugins.lua). No dupliques
-- binds individuales aquí para cada modo.

-- Theming and Wallpaper
hl.bind("CONTROL + " .. mainMod .. " + T", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))

-- Notifications
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"))

-- wayscriber
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("sh -lc '$HOME/.local/bin/toggle-wayscriber'"))

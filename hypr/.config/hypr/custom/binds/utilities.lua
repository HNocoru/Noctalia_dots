-- Adopted from end4 (hyprland/keybinds.lua). Screenshot, clipboard,
-- wallpaper y notificaciones ya están cubiertos por Noctalia (paneles
-- propios en config/binds/utilities.lua). Lo único que faltaba sin depender
-- de Quickshell ni de scripts que no existen en este setup es el OCR:
-- selecciona una región de pantalla, reconoce el texto y lo manda al
-- portapapeles. Requiere slurp, grim, tesseract y wl-copy (herramientas
-- Wayland genéricas, no específicas de ningún shell).
--
-- Grabación de pantalla NO se porta: en end4 depende de un script propio
-- (videos/record.sh) que no existe en este setup y Noctalia no expone un
-- "record" nativo vía `noctalia msg`, así que no hay equivalente directo —
-- se omite en vez de inventar uno.

local mainMod = "SUPER"

hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd(
    "bash -c 'grim -g \"$(slurp)\" - | tesseract - - | wl-copy'"
), { description = "Utilities: Character recognition >> clipboard" })

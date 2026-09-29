# Estructura nueva de ~/.config/hypr

## Qué se movió

- `binds.lua` (250 líneas, 6 dominios) → `config/binds/{window,launcher,hardware,utilities,workspace}.lua`
- `windowrules.lua` (130 líneas, 7 dominios) → `config/behavior/windowrules/{floating,gaming,apps,opacity,fixes}.lua`
- El resto de archivos se movieron tal cual a su carpeta de capa (`tokens/`, `system/`, `appearance/`, `layout/`), sin tocar contenido.
- `hyprland.lua` es ahora el composition root: carga todo `config/*` y, al final, intenta cargar cada `custom/*` equivalente (silenciosamente lo salta si no existe).

## Instalar

1. Respalda tu `~/.config/hypr` actual (`cp -r ~/.config/hypr ~/.config/hypr.bak`).
2. Reemplaza `config/` y `hyprland.lua` con los de este paquete. `xdph.conf` queda igual (no lo toques).
3. Recarga Hyprland (`hyprctl reload` o relogin) y verifica que no haya errores.
4. La carpeta `custom/` viene vacía — ahí es donde vive tu configuración cuando empecemos a portar tus binds de end4 (Fase 1).

## Un detalle a verificar en tu máquina

`hyprland.lib` de end4 provee un helper `is_file_exists` propio de su motor. En este dump de Noctalia no vi ese helper declarado en ningún archivo, así que en vez de asumir que existe, `hyprland.lua` usa:

- `pcall(require, ...)` para los overrides de `custom/*.lua` (funciona con Lua puro, no depende de ningún helper de Noctalia/Hyprland).
- Un `file_exists` local basado en `io.open` para el bloque de `workspaces.lua`/`monitors.lua` de nwg-displays (ese sí estaba en el `hyprland.lua` original usando `is_file_exists`, que reemplacé por la misma razón).

Si al recargar ves un error de Lua apenas arranca (antes de que se vean binds/colores), lo más probable es que sea aquí — avísame el mensaje exacto y lo ajustamos.

## Cómo agregar un override

Ejemplo: quieres cambiar solo tus keybinds de ventana sin tocar el resto.

```
custom/binds/window.lua
```

Ese archivo se carga automáticamente después de `config/binds/window.lua` — no necesitas registrarlo en ningún lado, `hyprland.lua` ya lo espera.

## Changelog — port de end4 (esta iteración)

`config/` **no se tocó**. Todo lo nuevo vive en `custom/`, comparando línea por línea contra `hyprland/{general,keybinds,rules,variables}.lua` de end4:

- **`custom/appearance/animations.lua`** — leaves que Noctalia no definía (windowsIn/Out/Move, fade, layers, border, zoom) + estilo de Workspace Special pedido (`slidevert` + curvas emphasized, en vez de `slide top/bottom`).
- **`custom/appearance/decorations.lua`** — `rounding_power`, dim de ventanas inactivas, sombra, calidad de blur, y `blur.special = false` (Workspace Special). No se tocó `gaps_in/out`, `border_size` ni `blur.size/passes`: ya estaban afinados en `config/`.
- **`custom/layout/workspaces.lua`** — `gaps_out = 30` en `special:special` (Workspace Special).
- **`custom/behavior/misc.lua`** — claves de `general`/`misc`/`binds` que end4 trae y Noctalia no (tearing, snap, dpms, `hide_special_on_workspace_change`). No se tocó `vrr`, `enable_swallow` ni `swallow_regex`: Noctalia ya tenía su propio valor funcionando.
- **`custom/behavior/layerrules.lua`** — *(nuevo dominio, no existía `config/behavior/layerrules.lua`)*. Solo lo genérico (`xray`, `hyprpicker`, `gtk-layer-shell`, `gtk4-layer-shell`). Las decenas de reglas de end4 para namespaces `quickshell:*` se omitieron: no hay equivalente directo confirmado en el shell de Noctalia todavía (pendiente cuando revisemos su documentación).
- **`custom/behavior/windowrules/floating.lua` y `apps.lua`** — diálogos y apps que `config/` no cubría (Select a File, Open Folder, pavucontrol con clase distinta, `kcm_*`, Zotero, Warp, etc). Todo lo que ya estaba en `config/` (Dolphin, Ark, satty, PIP, screen-sharing, tearing) no se duplicó.
- **`custom/binds/launcher.lua`** — `SUPER+I` (mapeado al mismo `settings-toggle` que ya usa `SUPER+Z`, porque ese *es* el equivalente real de Noctalia), Office software y Volume mixer (no tenían bind ni app en Noctalia).
- **`custom/binds/utilities.lua`** — OCR de pantalla, autocontenido con `slurp`/`grim`/`tesseract`/`wl-copy` (sin depender de scripts de Quickshell que no existen aquí). Grabación de pantalla se omitió: no hay equivalente directo.
- **`custom/system/inputs.lua`** — `numlock`, repeat rate, touchpad, calidad del zoom del cursor. `kb_layout` **no** se tocó a propósito (es tu distribución de teclado real, no algo que falte).
- **`custom/tokens/variables.lua`** — se agregaron `OFFICE_SOFTWARE` y `VOLUME_MIXER` al final del archivo existente (tu `workspace_in_group` sigue intacto arriba).
- **`hyprland.lua`** — una sola línea nueva: `safe_require("custom.behavior.layerrules")`, porque ese dominio no tenía contraparte en `config/`.

### Pendiente / no resuelto automáticamente

- **`SUPER+C` y `SUPER+T`**: en end4 son *code editor* y *terminal*; en Noctalia ya son *calculadora* y tu `EDITOR`. Es un choque real de esquema de teclas — no se remapeó nada para no romper lo que ya usas. Si quieres el flujo de end4 aquí, dime cuál combinación prefieres sacrificar.
- **`SUPER+X`** (text editor en end4) también choca: en Noctalia ya es *panel-toggle control-center*. Mismo caso.
- Grabación de pantalla y namespaces de capa específicos de Noctalia: quedan para cuando revisemos su documentación con calma, como acordamos.


local mainMod = "SUPER"
local noctCall = "noctalia msg "

------------------
---- PLUGINS -----
------------------

-- Keymap
hl.bind(mainMod .. " + slash", hl.dsp.exec_cmd(noctCall .. "panel-toggle blackbartblues/keymap:panel"))

-- Obsidian (panel id: "manager")
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(noctCall .. "panel-toggle davemhammer/obsidian:manager"))

-- Sticky Notes (panel id: "panel")
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(noctCall .. "panel-toggle ahmedhossamdev/sticky-notes:panel"))

-- To Do (panel id: "panel")
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(noctCall .. "panel-toggle nightwatch75/todo:panel"))

-- Pomodoro Timer (panel id: "panel")
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(noctCall .. "panel-toggle thepunkoff/pomodoro:panel"))

-- Screen Toolkit (panel id: "panel" — modo estándar; hay también "panel-legacy" y "result")
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd(noctCall .. "panel-toggle alexander/screen-toolkit:panel"))

-- Key Visualizer (panel id: "overlay" — el overlay flotante persistente en sí)
--hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle h-jangra/keyviz:overlay"))

-- Key Visualizer: toggle on/off (útil para pausar mientras escribes contraseñas)
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(noctCall .. "plugin h-jangra/keyviz:keylistener all toggle"))

-- Phone Connect (panel id: "details" — variante "attached" a la barra)
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd(noctCall .. "panel-toggle icefish/phone-connect:details"))

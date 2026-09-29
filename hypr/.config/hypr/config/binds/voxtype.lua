-------------------
---- VOXTYPE ------
-------------------

-- Mantener SUPER + R para grabar
hl.bind("SUPER + R", hl.dsp.exec_cmd("voxtype record start"))

-- Soltar R para detener y transcribir
hl.bind("SUPER + R", hl.dsp.exec_cmd("voxtype record stop"), { release = true })

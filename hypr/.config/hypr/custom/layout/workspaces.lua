-- Adoptado de end4 (hyprland/rules.lua): el scratchpad usa un gap exterior
-- más grande que el resto de workspaces, lo que da la sensación de que las
-- ventanas "encogen" dentro de un marco propio en vez de ocupar todo el
-- monitor como un workspace normal.
--
-- Corrección de Workspace Special pedida por el usuario.
hl.workspace_rule({ workspace = "special:special", gaps_out = 30 })

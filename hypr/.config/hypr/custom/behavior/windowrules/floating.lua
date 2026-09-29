-- Adopted from end4 (hyprland/rules.lua). config/behavior/windowrules/floating.lua
-- ya cubre "Open File", "Save As", "File Upload", "Choose wallpaper",
-- "Library" y varios diálogos genéricos (title/class que contienen "dialog").
-- Aquí solo se agregan los patrones de end4 que NO calzan con esos regex:
-- "Select a File", "Open Folder" y los sufijos "wants to save"/"wants to open"
-- (diálogos de portal que no empiezan con esas palabras, terminan con ellas).

local extraModalMatches = {
    { title = "^(Select a File)(.*)$" },
    { title = "^(Open Folder)(.*)$" },
    { title = "^(.*)(wants to save)$" },
    { title = "^(.*)(wants to open)$" },
}
for _, m in ipairs(extraModalMatches) do
    hl.window_rule({ match = m, float = true, center = true })
end

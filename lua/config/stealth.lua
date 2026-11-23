-- Sin indicadores de modo + Ctrl+C para copiar al portapapeles del sistema.
-- Para desactivar todo: borrar este archivo y su require en init.lua.

-- Sin "-- VISUAL --" ni contador de líneas seleccionadas abajo
vim.opt.showmode = false
vim.opt.showcmd = false

-- Ctrl+C en selección (mouse o teclado): copia al portapapeles y sale sin mostrar nada
vim.keymap.set("x", "<C-c>", '"+y', { silent = true, desc = "Copiar al portapapeles" })

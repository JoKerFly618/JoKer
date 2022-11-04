-- Provides key mapping to add surrounding characters.( visually select then press s<char> or press ys{motion}{char})
-- Provides key mapping to replace surrounding characters.( cs<from><to> )
-- Provides key mapping to delete surrounding characters.( ds<char> )

local status, surround = pcall(require, "surround")
if not status then
   vim.notify("没有找到 surround")
   return
end

surround.setup({
   mappings_style = "surround",
})

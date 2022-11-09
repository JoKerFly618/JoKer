local status, tabout = pcall(require, "tabout")
if not status then
   vim.notify("没有找到 tabout")
   return
end

tabout.setup({
   tabkey = "<A-l>",
   backwards_tabkey = "<A-h>",
   ignore_beginning = false,
   act_as_tab = true,
   enable_backward = true,
   completion = true,
   tabouts = {
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = "`", close = "`" },
      { open = "(", close = ")" },
      { open = "[", close = "]" },
      { open = "{", close = "}" },
   },
   exclude = {},
})

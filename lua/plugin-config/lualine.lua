-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
   vim.notify("没有找到 lualine")
   return
end

lualine.setup({
   options = {
      -- 设置主题配色
      theme = "tokyonight",
      -- 设置分段中的组件分隔符
      component_separators = { left = "|", right = "|" },
      -- https://github.com/ryanoasis/powerline-extra-symbols
      -- 设置分段分隔符
      section_separators = { left = " ", right = "" },
   },

   extensions = { "nvim-tree", "toggleterm" },

   sections = {
      lualine_a = { 'mode' },

      lualine_b = { 'branch', 'diff', 'diagnostics' },

      lualine_c = {
         "filename",

         -- lsp 读取进度被  fidget插件替代
         -- {
         --    "lsp_progress",
         --    spinner_symbols = { " ", " ", " ", " ", " ", " " },
         -- },
      },

      lualine_x = {
         "filesize",
         {
            "fileformat",
            symbols = {
               unix = '', -- e712
               dos = '', -- e70f
               mac = '', -- e711
            },

            --symbols = {
            --  unix = "LF",
            --  dos = "CRLF",
            --  mac = "CR",
            --},
         },
         "encoding",
         "filetype",
      },

      lualine_y = { 'progress' },
      lualine_z = { 'location' },
   },
})

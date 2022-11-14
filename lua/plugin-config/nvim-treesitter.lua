local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
   vim.notify("没有找到 nvim-treesitter")
   return
end

treesitter.setup({
   -- 安装 language parser
   -- :TSInstallInfo 命令查看支持的语言
   ensure_installed = { "json", "html", "css", "vim", "lua", "cpp", "c_sharp", "rust", "python", "help" },
   -- 启用代码高亮模块
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },

   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = "<CR>",
         node_incremental = "<CR>",
         node_decremental = "<BS>",
         scope_incremental = "<TAB>",
      },
   },

   indent = {
      enable = true,
   },

   on_attach = require("keybindings").treesitter(),
})

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
vim.opt.foldlevel = 99

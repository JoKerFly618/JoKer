-- 基础设置
require('basic')

-- 快捷键映射
require('keybindings')

-- Packer 插件管理
require("plugins")

-- 主题设置
require("colorscheme")

-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.toggleterm")
require("plugin-config.surround")
require("plugin-config.comment")
require("plugin-config.nvim-autopairs")
require("plugin-config.gitsigns")
require("plugin-config.hop")
require("plugin-config.tabout")
require("plugin-config.lsp_signature")

-- 内置LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")

-- 断点调试插件
require("dap.vimspector")

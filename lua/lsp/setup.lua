-- :h mason-default-settings
require("mason").setup({
   ui = {
      icons = {
         package_installed = "✓",
         package_pending = "➜",
         package_uninstalled = "✗",
      },
   },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
   -- 确保安装，根据需要填写
   ensure_installed = {
      "sumneko_lua", -- lua
      -- "omnisharp", -- c#
      "csharp_ls", -- c#
      "clangd", -- c/c++
      "cmake", -- cmake
      "rust_analyzer", -- rust
      "pylsp", -- python
      "marksman", -- markdown
      "jdtls", -- java
   },
})

local lspconfig = require("lspconfig")

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
   sumneko_lua = require("lsp.config.lua"),
   -- omnisharp = require("lsp.config.csharp"),
   csharp_ls = require("lsp.config.csharp"),
   clangd = require("lsp.config.cpp"),
   cmake = require("lsp.config.cmake"),
   rust_analyzer = require("lsp.config.rust"),
   pylsp = require("lsp.config.python"),
   marksman = require("lsp.config.markdown"),
   jdtls = require("lsp.config.java"),
}

for name, config in pairs(servers) do
   if config ~= nil and type(config) == "table" then
      -- 自定义初始化配置文件必须实现on_setup 方法
      config.on_setup(lspconfig[name])
   else
      -- 使用默认参数
      lspconfig[name].setup({})
   end
end

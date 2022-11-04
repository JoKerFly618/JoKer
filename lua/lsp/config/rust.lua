local lspconfig_opts = {
   capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
   flags = {
      debounce_text_changes = 150,
   },

   on_attach = function(client, bufnr)
      -- 禁用格式化功能，交给专门插件插件处理
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      local function buf_set_keymap(...)
         vim.api.nvim_buf_set_keymap(bufnr, ...)
      end

      -- 绑定快捷键
      require("keybindings").mapLSP(buf_set_keymap)
      -- 保存时自动格式化
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
   end,

   settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
         -- enable clippy on save
         checkOnSave = {
            command = "clippy",
         },
      },
   },
}

return {
   on_setup = function(server)
      local ok_rt, rust_tools = pcall(require, "rust-tools")
      if not ok_rt then
         print("Failed to load rust tools, will set up `rust_analyzer` without `rust-tools`.")
         server.setup(lspconfig_opts)
      else
         -- We don't want to call lspconfig.rust_analyzer.setup() when using rust-tools
         rust_tools.setup({
            server = lspconfig_opts,
            -- dap = require("dap.nvim-dap.rust"),
         })
      end
   end,
}

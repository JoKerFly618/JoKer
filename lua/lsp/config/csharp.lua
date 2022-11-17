local opts = {
   --[[ cmd = {
      -- "dotnet",
      "/home/joker/.dotnet/dotnet",

      "/home/joker/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll"
      -- "/media/joker/works/somework/omnisharp/OmniSharp.dll"
   },

   -- filetypes = { "cs", "vb" },

   -- Enables support for reading code style, naming convention and analyzer
   -- settings from .editorconfig.
   enable_editorconfig_support = true,

   -- If true, MSBuild project system will only load projects for files that
   -- were opened in the editor. This setting is useful for big C# codebases
   -- and allows for faster initialization of code navigation features only
   -- for projects that are relevant to code that is being edited. With this
   -- setting enabled OmniSharp may load fewer projects and may thus display
   -- incomplete reference lists for symbols.
   enable_ms_build_load_projects_on_demand = false,

   -- Enables support for roslyn analyzers, code fixes and rulesets.
   enable_roslyn_analyzers = false,

   -- Specifies whether 'using' directives should be grouped and sorted during
   -- document formatting.
   organize_imports_on_format = false,

   -- Enables support for showing unimported types and unimported extension
   -- methods in completion lists. When committed, the appropriate using
   -- directive will be added at the top of the current file. This option can
   -- have a negative impact on initial completion responsiveness,
   -- particularly for the first few completion sessions after opening a
   -- solution.
   enable_import_completion = false,

   -- Specifies whether to include preview versions of the .NET SDK when
   -- determining which version to use for project loading.
   sdk_include_prereleases = true,

   -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
   -- true
   analyze_open_documents_only = false, ]]

   on_attach = function(client, bufnr)
      -- 禁用格式化功能，交给专门插件插件处理
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      local function buf_set_keymap(...)
         vim.api.nvim_buf_set_keymap(bufnr, ...)
      end

      -- 绑定快捷键
      require('keybindings').mapLSP(buf_set_keymap)
      -- 保存时自动格式化
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
      -- 函数参数加强
      require "lsp_signature".on_attach({}, bufnr)
   end,
}

return {
   on_setup = function(server)
      server.setup(opts)
   end,
}

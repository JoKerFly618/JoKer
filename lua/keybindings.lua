local map = vim.api.nvim_set_keymap

-- 复用 opt 参数
local opt = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

---------------- 基础快捷键设置 ----------------
-- 取消 s 默认功能
map("n", "s", "", opt)

-- 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sf", ":sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)

-- 关闭其他
map("n", "so", "<C-w>o", opt)

-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "sl", ":vertical resize -20<CR>", opt)
map("n", "sh", ":vertical resize +20<CR>", opt)

-- 上下比例控制
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)

-- 等比例
map("n", "sn", "<C-w>=", opt)

-- Terminal相关
-- 用 toggleterm 插件替代
-- map("n", "<leader>c", ":sp | terminal<CR>i", opt)
-- map("n", "<leader>vc", ":vsp | terminal<CR>i", opt)
map("t", "<C-d>", [[ <C-\><C-n>:q<CR> ]], opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<A-j>", "4j", opt)
map("n", "<A-k>", "4k", opt)

-- ctrl h / ctrl + l  只移动9行，默认移动半屏
map("n", "<A-l>", "9k", opt)
map("n", "<A-h>", "9j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 快速返回普通模式
map("i", "jj", "<Esc>", opt)

-- 快速保存
map("i", "<leader>w", "<Esc>:w<cr>", opt)
map("n", "<leader>w", ":w<cr>", opt)

-- 文件比对
-- 命令行下 diffvim [file1] [file2]
-- vim下 vert diffsplit [otherFile]
-- vim双屏下，快捷键如下
map("n", "<leader>df", ":diffthis<cr>", opt)
-- dp 将差异点的当前文档内容应用到另一文档（diff put）
-- do 将差异点的另一文档的内容拷贝到当前文档（diff get）
-- zo (folding open)
-- zc (folding close)

-- 二进制展示与还原
-- 显示的文件修改仅影响下次打开时的格式
map("n", "<leader>sb", ":%!xxd<cr>", opt)
map("n", "<leader>sbb", ":%!xxd -r<cr>", opt)

-- 退出
map("n", "<leader>q", ":q<CR>", opt)
map("n", "<leader>qq", ":q!<CR>", opt)
map("n", "<leader>Q", ":qa!<CR>", opt)

-- 安装插件
map("n", "<leader>m", ":PackerSync<CR>", opt)

---------------- 插件快捷键设置 ----------------
local pluginKeys = {}

-- nvim-tree 文件树
map("n", "<leader>v", ":NvimTreeToggle<CR>", opt)

pluginKeys.nvimTreeList = {
   -- 打开文件或文件夹
   { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
   -- 分屏打开文件
   { key = "v", action = "vsplit" },
   { key = "h", action = "split" },
   -- 显示隐藏文件
   { key = "i", action = "toggle_custom" },
   { key = ".", action = "toggle_dotfiles" },
   -- 文件操作
   { key = "<F5>", action = "refresh" },
   { key = "a", action = "create" },
   { key = "d", action = "remove" },
   { key = "r", action = "rename" },
   { key = "x", action = "cut" },
   { key = "c", action = "copy" },
   { key = "p", action = "paste" },
   { key = "s", action = "system_open" },
}

-- bufferline 缓存页面栏
pluginKeys.bufferline = function()
   -- 左右Tab切换
   map("n", "<space>d", ":BufferLineCyclePrev<CR>", opt)
   map("n", "<space>f", ":BufferLineCycleNext<CR>", opt)

   -- 关闭和选择
   --"moll/vim-bbye"
   map("n", "<space>g", ":Bdelete!<CR>", opt)
   map("n", "<space>l", ":BufferLineCloseRight<CR>", opt)
   map("n", "<space>h", ":BufferLineCloseLeft<CR>", opt)
   map("n", "<space>c", ":BufferLinePickClose<CR>", opt)
   map("n", "<space>v", ":BufferLinePick<CR>", opt)
end


-- Telescope 文件模糊查找
pluginKeys.telescope = function()
   -- 查找文件
   map("n", "<C-p>", ":Telescope find_files<CR>", opt)
   -- 全局搜索
   map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
   -- 历史搜索
   map("n", "<leader>h", ":Telescope oldfiles<CR>", opt)
end


pluginKeys.telescopeList = {
   i = {
      -- 上下移动
      ["<C-j>"] = "move_selection_next",
      ["<C-k>"] = "move_selection_previous",
      ["<Down>"] = "move_selection_next",
      ["<Up>"] = "move_selection_previous",
      -- 预览窗口上下滚动
      ["<C-h>"] = "preview_scrolling_up",
      ["<C-l>"] = "preview_scrolling_down",
      -- 历史记录
      ["<C-n>"] = "cycle_history_next",
      ["<C-p>"] = "cycle_history_prev",
      -- 关闭窗口
      ["<C-d>"] = "close",
   },
}

-- TreeSitter 语法高亮
pluginKeys.treesitter = function()
   -- 高亮模式切换
   map("n", "<leader>ts", ":TSBufToggle highlight<CR>", opt)
   -- 全文缩进
   map("n", "<leader>e", "gg=G<C-o>", opt)
end

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
   -- rename
   -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
   mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)

   -- code action
   -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
   mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)

   -- go xx
   -- mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
   mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
   -- mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)

   -- readme
   -- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
   mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)

   -- Lspsaga 替换 gr
   -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
   mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)

   -- diagnostic
   -- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
   -- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
   -- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
   mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
   mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
   mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)

   -- formatting
   mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opt)

   -- 未用
   -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
   -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
   -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
   -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
   -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
   -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
   -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
   -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
   local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
   end
   local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
   end

   return {
      -- 上一个
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      -- 下一个
      ["<C-j>"] = cmp.mapping.select_next_item(),
      -- 出现补全
      ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      -- 取消
      ["<A-,>"] = cmp.mapping({
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
      }),
      -- 确认
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({
         select = true,
         behavior = cmp.ConfirmBehavior.Replace,
      }),
      -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      -- 如果窗口内容太多，可以滚动
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      -- snippets 跳转
      ["<C-l>"] = cmp.mapping(function(_)
         if vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
         end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function()
         if vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
         end
      end, { "i", "s" }),

      -- super Tab
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
         elseif has_words_before() then
            cmp.complete()
         else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
         end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function()
         if cmp.visible() then
            cmp.select_prev_item()
         elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
         end
      end, { "i", "s" }),
      -- end of super Tab
   }
end

-- 断点调试
pluginKeys.mapVimspector = function()
   -- 开始
   map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
   -- 结束
   map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
   -- 继续
   map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
   -- 设置断点
   map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
   map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
   --  stepOver, stepOut, stepInto
   map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
   map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
   map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
end

-- toggleterm 命令行窗口强化
pluginKeys.mapToggleTerm = function(toggleterm)
   -- <leader>ta 浮动
   -- <leader>tb 右侧
   -- <leader>tc 下方
   -- 特殊lazygit 窗口，需要安装lazygit
   -- <leader>tg lazygit
   vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
   vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
   vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
   vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
   local gs = package.loaded.gitsigns

   ---@diagnostic disable-next-line: redefined-local
   local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
   end

   -- Navigation
   map("n", "<leader>gj", function()
      if vim.wo.diff then
         return "]c"
      end
      vim.schedule(function()
         gs.next_hunk()
      end)
      return "<Ignore>"
   end, { expr = true })

   map("n", "<leader>gk", function()
      if vim.wo.diff then
         return "[c"
      end
      vim.schedule(function()
         gs.prev_hunk()
      end)
      return "<Ignore>"
   end, { expr = true })

   map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
   map("n", "<leader>gS", gs.stage_buffer)
   map("n", "<leader>gu", gs.undo_stage_hunk)
   map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
   map("n", "<leader>gR", gs.reset_buffer)
   map("n", "<leader>gp", gs.preview_hunk)
   map("n", "<leader>gb", function()
      gs.blame_line({ full = true })
   end)
   map("n", "<leader>gd", gs.diffthis)
   map("n", "<leader>gD", function()
      gs.diffthis("~")
   end)
   -- toggle
   map("n", "<leader>gtd", gs.toggle_deleted)
   map("n", "<leader>gtb", gs.toggle_current_line_blame)
   -- Text object
   map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

-- git diffview
map("n", "<leader>vd", ":DiffviewOpen<CR>", opt)
map("n", "<leader>cd", ":DiffviewClose<CR>", opt)
map("n", "<leader>ld", ":DiffviewFileHistory<CR>", opt)

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
   -- Normal 模式快捷键
   toggler = {
      line = "gcc", -- 行注释
      block = "gbc", -- 块注释
   },
   -- Visual 模式
   opleader = {
      line = "gc",
      bock = "gb",
   },
}

-- 光标快速跳转插件
pluginKeys.hop = function()
   map("n", "<space>w", ":HopWord<CR>", opt)
   map("n", "<space>c", ":HopChar1<CR>", opt)
   map("n", "<space>cc", ":HopChar2<CR>", opt)
   map("n", "<space>p", ":HopPattern<CR>", opt)
   map("n", "<space>s", ":HopLineStart<CR>", opt)
end

return pluginKeys

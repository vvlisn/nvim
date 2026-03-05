-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 基础操作
vim.keymap.set("n", "<leader>p", ":set invpaste paste?<CR>", opt) -- 格式化文件中所有代码行（nvim-treesitter 代码格式化）

vim.keymap.set("n", "<leader>t", "gg=G", opt) -- 格式化文件中所有代码行（nvim-treesitter 代码格式化）

-- 替代 gcc 的快捷键  
-- vim.keymap.set("n", "<leader>c", "gcc", { noremap = true, silent = true }) -- 默认将 leader 设置为反斜杠 '\'  
-- 替代 gc% 的快捷键  
-- vim.keymap.set("n", "<leader>cc", "gc%", { noremap = true, silent = true })

-- 窗口操作
-- 取消 s 默认功能
vim.keymap.set("n", "s", "", opt)

-- windows 分屏快捷键
vim.keymap.set("n", "sv", ":vsp<CR>", opt)
vim.keymap.set("n", "sh", ":sp<CR>", opt)
vim.keymap.set("n", "sc", "<C-w>c", opt) -- 关闭当前
vim.keymap.set("n", "so", "<C-w>o", opt) -- 关闭其他

-- 简化窗口跳转快捷键
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Switch Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Switch Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Switch Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Switch Right Window" })

-- 上下移动选中文本
-- vim.keymap.set("v", "j", ":move '>+1<CR>gv-gv", opt)
-- vim.keymap.set({"n", "i"}, "K", ":move '<-2<CR>gv-gv", opt)

-- insert 模式下，跳到行首行尾
vim.keymap.set("i", "<C-h>", "<ESC>I", opt)
vim.keymap.set("i", "<C-l>", "<ESC>A", opt)

-- 打开或者光比 neo-tree
-- vim.keymap.set("n", "<C-b>", ":Neotree<CR>", opt)

-- 清除高亮
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear Highlights" })

-- 简化退出、保存文件
vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", vim.cmd.quit, { desc = "Quit File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.write, { desc = "Save File" })

-- Go IDE
-- 绑定 Ctrl+i 快捷键执行 GoFillStruct
-- vim.keymap.set("n", "<C-i>", ":GoFillStruct<CR>", { desc = "Fill Struct in Go" })
vim.keymap.set("n", "fe", ":GoIfErr<CR>", { desc = "Fill Struct in Go" })
vim.keymap.set("n", "fs", ":GoFillStruct<CR>", { desc = "Fill Struct in Go" })
vim.keymap.set("n", "<leader>fc", ":GoFillSwitch<CR>", { desc = "Fill Struct in Go" })
vim.keymap.set("n", "<leader>ta", ":GoAddTag<CR>", { desc = "Fill Struct in Go" })
vim.keymap.set("n", "<leader>tr", ":GoRmTag<CR>", { desc = "Fill Struct in Go" })
vim.keymap.set("n", "<leader>tc", ":GoClearTag<CR>", { desc = "Fill Struct in Go" })
vim.keymap.set("n", "<leader>i", ":GoImports<CR>", { desc = "Fill Struct in Go" })

-- LSP 快捷键（全局定义）
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-- 跳转到定义（使用 FzfLua 增强）
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Go to Definition (FzfLua)" })
vim.keymap.set("n", "<CR>", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Go to Definition" })

-- 跳转到引用（使用 FzfLua 增强）
vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "Go to References (FzfLua)" })

-- 跳转到实现（使用 FzfLua 增强）
vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "Go to Implementations (FzfLua)" })

-- 显示文档
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })

-- FZF-Lua
vim.keymap.set("n", "<C-e>", "<cmd>FzfLua buffers<CR>", { desc = "buffers" })  
vim.keymap.set("n", "ss", "<cmd>FzfLua live_grep<CR>", { desc = "lines" })  
vim.keymap.set("n", "gf", "<cmd>FzfLua files<CR>", { desc = "lines" })  
vim.keymap.set("n", "<C-f>", "<cmd>FzfLua lgrep_curbuf<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>r", "<cmd>FzfLua oldfiles<CR>", { desc = "mru" })   --mru: most recent used
vim.keymap.set("n", "<leader>s", "<cmd>FzfLua treesitter<CR>", { desc = "mru" })   --mru: most recent used
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua search_history<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua marks<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>gb", "<cmd>FzfLua git_bcommits<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "lines" })  

-- Git 快捷键
-- gitsigns 快捷键
vim.keymap.set("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { expr = true, desc = "Jump to next hunk" })

vim.keymap.set("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { expr = true, desc = "Jump to prev hunk" })

-- 暂存/重置块
vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hb", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
vim.keymap.set("n", "<leader>hd", ":Gitsigns diffthis<CR>", { desc = "Diff this" })
vim.keymap.set("n", "<leader>hD", ":Gitsigns diffthis ~<CR>", { desc = "Diff this ~" })
vim.keymap.set("n", "<leader>hq", ":diffoff<CR>:q<CR>", { desc = "Close diff view" })

-- blame.nvim 快捷键
vim.keymap.set("n", "<leader>gb", ":BlameToggle<CR>", { desc = "Toggle git blame" })

-- Markdown 预览快捷键
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })

-- 其他
vim.keymap.set('n', '<leader><leader>', function()
  vim.wo.number = not vim.wo.number
end, { desc = 'Toggle line numbers' })

-- vim.keymap.set("i", "<C-BS>", "<C-W>")
--vim.keymap.set("i", "<C-H>", "<C-W>")
vim.keymap.set("i", "<C-H>", "<BS>", { noremap = true, silent = true })

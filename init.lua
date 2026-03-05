require("configs.basic") -- 加载全局配置
require("configs.lazy")    -- 加载插件管理器
require("configs.keymaps") -- 加载全局快捷键

-- -- 必须设置在 init.lua 的最外层（非函数内部）--
vim.opt.termguicolors = true -- 启用真彩色支持--
vim.o.background = "dark" -- or "light" for light mode
vim.cmd.colorscheme("tokyonight-night") -- 应用主题

-- 配置诊断显示
vim.diagnostic.config({
  virtual_text = true,      -- 显示虚拟文本
  signs = true,             -- 显示左侧符号
  underline = true,         -- 显示下划线
  update_in_insert = false, -- 不在插入模式更新
})

-- 内联提示由 LSP 配置单独控制
-- vim.lsp.inlay_hint.enable(false)
-- vim.cmd.colorscheme("gruvbox") -- 应用主题

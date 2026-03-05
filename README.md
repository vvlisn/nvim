# Neovim 配置

一个现代化的 Neovim 配置，专为 Go 语言开发优化，使用 lazy.nvim 作为插件管理器。

## 项目结构

```
nvim/
├── init.lua                    # 主入口文件
├── lazy-lock.json              # 插件版本锁定
├── .stylua.toml                # Lua 代码格式化配置
├── LICENSE                     # MIT 许可证
├── lua/
│   ├── configs/               # 基础配置
│   │   ├── basic.lua          # 编辑器基础设置
│   │   ├── keymaps.lua        # 全局快捷键映射
│   │   └── lazy.lua           # lazy.nvim 配置
│   └── plugins/               # 插件配置
│       ├── alpha.lua          # 启动界面
│       ├── autopairs.lua      # 自动括号配对
│       ├── blame.lua          # Git blame 显示
│       ├── catppuccin.lua     # Catppuccin 主题
│       ├── cmp.lua            # 代码补全
│       ├── comment.lua        # 注释插件
│       ├── conform.lua        # 代码格式化
│       ├── fzf.lua            # 模糊查找
│       ├── gitsigns.lua       # Git 状态显示
│       ├── go-vim.lua         # Go 语言支持
│       ├── gruvbox.lua        # Gruvbox 主题
│       ├── guess-indent.lua   # 智能缩进检测
│       ├── indent-blankline.lua # 缩进参考线
│       ├── lsp.lua            # LSP 配置
│       ├── lualine.lua        # 状态栏
│       ├── neo-tree.lua       # 文件管理器
│       ├── notify.lua         # 通知系统
│       ├── root.lua           # 项目根目录检测
│       ├── toggleterm.lua     # 终端集成
│       ├── tokyonight.lua     # Tokyo Night 主题
│       ├── treesitter.lua     # 语法高亮
│       └── which-key.lua      # 快捷键提示
```

## 特性

### 🚀 现代化配置
- 使用 Neovim 0.11+ 和 nvim-lspconfig v3.0.0+ 的新 API
- 完全兼容最新的 LSP 配置标准
- 模块化配置结构，易于维护和扩展

### 🔧 编辑器功能
- **基础设置**: 完整的编辑器配置（编码、缩进、搜索等）
- **主题支持**: Tokyo Night（默认）、Gruvbox、Catppuccin
- **状态栏**: lualine 提供美观的状态信息
- **文件管理**: neo-tree 替代 netrw，支持 Git 集成
- **终端**: toggleterm 提供浮动终端

### 💻 代码开发
- **LSP 支持**: 使用最新的 `vim.lsp.config` API
- **Go 语言优化**: 专门的 Go 开发配置（gopls、go-vim）
- **代码补全**: nvim-cmp 提供智能补全
- **语法高亮**: treesitter 支持多种语言
- **代码格式化**: conform.nvim 统一格式化

### 🔍 搜索与导航
- **模糊查找**: fzf-lua 提供快速文件、内容搜索
- **Git 集成**: gitsigns 显示 Git 状态，blame 显示提交信息
- **项目导航**: root.nvim 自动检测项目根目录

### 🛠️ Git 工作流
- **状态显示**: 侧边栏显示添加/修改/删除的行
- **块操作**: 暂存、重置、预览 Git 块
- **Blame 信息**: 显示每行的提交信息
- **文件树集成**: neo-tree 中显示 Git 状态

## 安装要求

### 系统依赖
- Neovim 0.11.0 或更高版本
- Git
- Go 1.21+（用于 Go 开发）
- gopls（Go 语言服务器）

### 可选依赖
- [fzf](https://github.com/junegunn/fzf) - 增强搜索体验
- [ripgrep](https://github.com/BurntSushi/ripgrep) - 快速文本搜索
- [fd](https://github.com/sharkdp/fd) - 快速文件查找

## 安装

1. **备份现有配置**（如果需要）：
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **克隆配置**：
   ```bash
   git clone https://github.com/yourusername/nvim.git ~/.config/nvim
   ```

3. **启动 Neovim**：
   ```bash
   nvim
   ```

4. **等待插件安装**：
   首次启动时会自动安装 lazy.nvim 和所有插件。

## 快捷键

### 全局快捷键
- `<leader>` = 空格键
- `<leader><leader>` - 切换行号显示
- `<ESC>` - 清除搜索高亮
- `<C-q>` - 退出文件
- `<C-s>` - 保存文件

### 窗口管理
- `sv` / `sh` - 垂直/水平分割窗口
- `sc` - 关闭当前窗口
- `so` - 关闭其他窗口
- `<C-h/j/k/l>` - 窗口间导航

### 文件管理
- `<C-b>` - 打开/关闭 neo-tree（文件管理器）
- `gf` - 使用 fzf 搜索文件
- `ss` - 使用 fzf 搜索内容

### LSP 快捷键
- `gd` - 跳转到定义（使用 fzf 增强）
- `gr` - 跳转到引用（使用 fzf 增强）
- `gi` - 跳转到实现（使用 fzf 增强）
- `K` - 显示文档
- `<leader>rn` - 重命名符号
- `<leader>ca` - 代码操作
- `<leader>f` - 格式化缓冲区

### Git 快捷键
- `]c` / `[c` - 跳转到下一个/上一个 Git 块
- `<leader>hs` - 暂存当前块
- `<leader>hr` - 重置当前块
- `<leader>hS` - 暂存整个缓冲区
- `<leader>hb` - 显示当前行的 blame 信息
- `<leader>hd` - 显示当前文件的差异（与暂存区比较）
- `<leader>hD` - 显示与 HEAD~ 的差异
- `<leader>hq` - 关闭 diff 视图
- `<leader>gb` - 切换 git blame 显示

**关闭 diff 视图的方法**:
1. 使用 `<leader>hq` 快捷键
2. 手动关闭 diff 窗口：`<C-w>c` 或 `:q`
3. 关闭所有其他窗口：`<C-w>o`
4. 使用 `:diffoff` 命令关闭 diff 模式，然后关闭窗口

### Go 语言专用
- `fe` - 生成错误处理（GoIfErr）
- `fs` - 填充结构体（GoFillStruct）
- `<leader>fc` - 填充 switch 语句
- `<leader>ta` - 添加结构体标签
- `<leader>tr` - 移除结构体标签
- `<leader>tc` - 清除结构体标签
- `<leader>i` - 整理 imports

### Markdown 预览
- `<leader>mp` - 切换 Markdown 预览
- `<leader>ms` - 停止 Markdown 预览

## 插件快捷键详细说明

### 核心插件

#### lazy.nvim
- **功能**: 插件管理器
- **快捷键**: `:Lazy` - 打开插件管理界面

#### nvim-lspconfig
- **功能**: LSP 配置（使用新的 vim.lsp.config API）
- **快捷键**:
  - `gd` - 跳转到定义（使用 fzf 增强）
  - `gr` - 跳转到引用（使用 fzf 增强）
  - `gi` - 跳转到实现（使用 fzf 增强）
  - `K` - 显示文档
  - `<leader>rn` - 重命名符号
  - `<leader>ca` - 代码操作
  - `<leader>f` - 格式化缓冲区

#### nvim-cmp
- **功能**: 代码补全引擎
- **快捷键**:
  - `<Tab>` / `<S-Tab>` - 上下选择补全项
  - `<CR>` - 确认选择
  - `<C-e>` - 关闭补全菜单
  - `<C-n>` / `<C-p>` - 上下导航补全项
  - `<C-y>` - 确认选择

#### nvim-treesitter
- **功能**: 语法高亮和代码分析
- **快捷键**:
  - `<leader>t` - 格式化整个文件
  - `zf` - 创建折叠
  - `zo` / `zc` - 打开/关闭折叠
  - `zR` / `zM` - 打开/关闭所有折叠

#### neo-tree.nvim
- **功能**: 文件管理器
- **快捷键**:
  - `<C-b>` - 打开/关闭文件管理器
  - **文件管理器内**:
    - `o` / `<CR>` - 打开文件或目录
    - `a` - 添加文件
    - `d` - 删除文件
    - `r` - 重命名文件
    - `y` - 复制文件路径
    - `[g` / `]g` - 导航到上一个/下一个 Git 修改的文件
    - `A` - Git 添加所有文件
    - `gu` - Git 取消暂存文件
    - `ga` - Git 添加文件
    - `gr` - Git 恢复文件
    - `gc` - Git 提交
    - `gp` - Git 推送

#### fzf-lua（替代 telescope）
- **功能**: 模糊查找界面
- **快捷键**:
  - `gf` - 搜索文件
  - `ss` - 搜索内容（live_grep）
  - `<C-e>` - 搜索缓冲区
  - `<C-f>` - 在当前缓冲区搜索内容
  - `<leader>r` - 搜索最近文件
  - `<leader>s` - 搜索 treesitter 符号
  - `<leader>h` - 搜索历史命令
  - `<leader>m` - 搜索标记
  - `<leader>gc` - 搜索 Git 提交
  - `<leader>gb` - 搜索当前文件的 Git 提交
  - `<leader>gs` - 查看 Git 状态

### 界面美化

#### tokyonight.nvim
- **功能**: 主题（默认）
- **快捷键**: 无特定快捷键，通过 `:colorscheme` 命令切换

#### lualine.nvim
- **功能**: 状态栏
- **快捷键**: 无特定快捷键

#### indent-blankline.nvim
- **功能**: 缩进参考线
- **快捷键**: 无特定快捷键

#### nvim-notify
- **功能**: 通知系统
- **快捷键**: 无特定快捷键

### 开发工具

#### go.nvim
- **功能**: Go 语言开发工具
- **快捷键**:
  - `fe` - 生成错误处理（GoIfErr）
  - `fs` - 填充结构体（GoFillStruct）
  - `<leader>fc` - 填充 switch 语句
  - `<leader>ta` - 添加结构体标签
  - `<leader>tr` - 移除结构体标签
  - `<leader>tc` - 清除结构体标签
  - `<leader>i` - 整理 imports

#### conform.nvim
- **功能**: 代码格式化
- **快捷键**:
  - `<leader>f` - 格式化当前缓冲区（与 LSP 共享）
  - 自动格式化：保存文件时自动格式化

#### nvim-autopairs
- **功能**: 自动括号配对
- **快捷键**:
  - 自动插入配对的括号、引号等
  - `<M-e>` - 快速扩展（如果支持）

#### Comment.nvim
- **功能**: 智能注释
- **快捷键**:
  - `gcc` - 注释/取消注释当前行
  - `gc` - 注释/取消注释选中区域（可视模式）
  - `gbc` - 块注释

#### guess-indent.nvim
- **功能**: 智能缩进检测
- **快捷键**: 无特定快捷键，自动检测文件缩进

### Git 集成

#### gitsigns.nvim
- **功能**: Git 状态显示和操作
- **快捷键**:
  - `]c` / `[c` - 跳转到下一个/上一个 Git 块
  - `<leader>hs` - 暂存当前块（普通/可视模式）
  - `<leader>hr` - 重置当前块（普通/可视模式）
  - `<leader>hS` - 暂存整个缓冲区
  - `<leader>hu` - 撤销暂存块
  - `<leader>hR` - 重置整个缓冲区
  - `<leader>hp` - 预览 Git 块
  - `<leader>hb` - 显示当前行的 blame 信息
  - `<leader>hd` - 显示当前文件的差异（与暂存区比较）
  - `<leader>hD` - 显示与 HEAD~ 的差异
  - `<leader>hq` - 关闭 diff 视图
  - `ih` - 选择当前 Git 块（文本对象）
- **关闭 diff 视图的方法**:
  1. 使用 `<leader>hq` 快捷键
  2. 手动关闭 diff 窗口：`<C-w>c` 或 `:q`
  3. 关闭所有其他窗口：`<C-w>o`
  4. 使用 `:diffoff` 命令关闭 diff 模式，然后关闭窗口

#### blame.nvim
- **功能**: Git blame 信息显示
- **快捷键**:
  - `<leader>gb` - 切换 git blame 显示

### 搜索与导航

#### nvim-rooter.lua
- **功能**: 项目根目录检测
- **快捷键**: 无特定快捷键，自动检测 `.git` 等根目录标记

#### which-key.nvim
- **功能**: 快捷键提示
- **快捷键**: 无特定快捷键，自动显示快捷键提示

#### toggleterm.nvim
- **功能**: 终端集成
- **快捷键**:
  - `<C-\>` - 打开/关闭浮动终端
  - 终端内: `<Esc>` - 退出终端模式

#### alpha.nvim
- **功能**: 启动界面
- **快捷键**: 无特定快捷键，启动时自动显示

#### markdown-preview.nvim
- **功能**: Markdown 实时预览
- **快捷键**:
  - `<leader>mp` - 切换 Markdown 预览
  - `<leader>ms` - 停止 Markdown 预览
- **使用说明**:
  - 在 Markdown 文件中使用 `<leader>mp` 打开/关闭预览
  - 预览在浏览器中打开，实时同步编辑内容
  - 使用 `<leader>ms` 强制停止预览

#### conform.nvim
- **功能**: 代码格式化
- **快捷键**: 已在开发工具部分说明

#### indent-blankline.nvim
- **功能**: 缩进参考线
- **快捷键**: 已在界面美化部分说明

## 配置说明

### LSP 配置迁移
本配置已从弃用的 `require('lspconfig')` API 迁移到新的 `vim.lsp.config` API（Neovim 0.11+）。主要更改：

```lua
-- 旧 API（已弃用）
require("lspconfig").gopls.setup({...})

-- 新 API
vim.lsp.config('gopls', {...})
vim.lsp.enable('gopls')
```

### 诊断配置
诊断功能已正确配置，支持：
- 虚拟文本显示错误信息
- 侧边栏符号显示
- 错误下划线高亮
- 严重性排序

### 快捷键管理
所有快捷键统一在 `lua/configs/keymaps.lua` 中管理，遵循项目结构规范：
- 全局快捷键在此文件中定义
- 插件特定的快捷键也在此文件中定义
- 不推荐在插件配置文件中定义快捷键

## 故障排除

### 常见问题

1. **LSP 不工作**：
   - 确保已安装对应的语言服务器（如 `gopls`）
   - 检查 `:LspInfo` 查看 LSP 状态

2. **插件安装失败**：
   - 检查网络连接
   - 删除 `~/.local/share/nvim/lazy` 重新安装

3. **快捷键冲突**：
   - 查看 `:map` 检查现有映射
   - 在 `keymaps.lua` 中调整冲突的快捷键

### 调试命令
- `:checkhealth` - 检查 Neovim 健康状态
- `:LspInfo` - 查看 LSP 服务器信息
- `:Mason` - 管理语言服务器安装
- `:Lazy` - 管理插件

## 自定义配置

### 添加新插件
1. 在 `lua/plugins/` 目录下创建新的配置文件
2. 在 `lua/configs/lazy.lua` 中导入该插件
3. 重启 Neovim 或运行 `:Lazy sync`

### 修改主题
在 `init.lua` 中修改：
```lua
vim.cmd.colorscheme("gruvbox")  -- 改为 gruvbox
-- 或
vim.cmd.colorscheme("catppuccin")  -- 改为 catppuccin
```

### 添加新的 LSP 服务器
在 `lua/plugins/lsp.lua` 中添加新的服务器配置，遵循新的 API 格式。

## 许可证

MIT License - 详见 LICENSE 文件。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个配置。

## 致谢

- [Neovim](https://neovim.io/) - 现代化的 Vim 编辑器
- [lazy.nvim](https://github.com/folke/lazy.nvim) - 优秀的插件管理器
- 所有插件开发者
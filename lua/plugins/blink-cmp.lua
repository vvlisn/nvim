return {
  "saghen/blink.cmp",
  version = "1.*", -- 使用 Git 标签版本以获取预构建二进制文件
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip", -- 如果需要代码片段支持
    "saghen/blink.compat", -- 兼容性层，用于支持 nvim-cmp 的 source
  },
  config = function()
    local blink = require("blink.cmp")
    
    blink.setup({
      -- 模糊匹配配置
      fuzzy = {
        implementation = "lua", -- 使用 Lua 实现，避免预构建二进制下载警告
        prebuilt_binaries = {
          force_version = "1", -- 强制使用版本1的预构建二进制文件
        },
      },
      
      -- 基本配置
      completion = {
        menu = {
          auto_show = true,
          max_height = 10,
        },
      },
      
      -- 键盘映射
      keymap = {
        ["<Tab>"] = { "accept" },
        ["<C-Space>"] = { "show", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
      
      -- Avante 兼容性配置
      compat = {
        "avante_commands",
        "avante_mentions",
        "avante_files",
      },
      
      -- 补全源配置
      sources = {
        default = { 'lsp', 'buffer', 'snippets', 'path', 'avante_commands', 'avante_mentions', 'avante_shortcuts', 'avante_files' },
        
        per_filetype = {
          -- 文件类型特定配置
          lua = { inherit_defaults = true },
        },
        
        providers = {
          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 90, -- 显示优先级高于 LSP
            opts = {},
          },
          avante_files = {
            name = "avante_files",
            module = "blink.compat.source",
            score_offset = 100, -- 显示优先级高于 LSP
            opts = {},
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 1000, -- 显示优先级高于 LSP
            opts = {},
          },
          avante_shortcuts = {
            name = "avante_shortcuts",
            module = "blink.compat.source",
            score_offset = 1000, -- 显示优先级高于 LSP
            opts = {},
          }
        },
      },
      
      -- 代码片段配置
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })
    
    -- 获取 LSP 能力供 LSP 配置使用
    vim.g.blink_capabilities = blink.get_lsp_capabilities()
  end,
}
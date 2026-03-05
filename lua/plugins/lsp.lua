return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    -- 获取 Blink.cmp 的 LSP 能力
    local capabilities = vim.g.blink_capabilities or
      (function()
        local ok, blink = pcall(require, "blink.cmp")
        if ok then
          return blink.get_lsp_capabilities()
        end
        return {}
      end)()

    -- 通用 on_attach 函数
    local function on_attach(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- 启用文档高亮
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          group = "lsp_document_highlight",
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          group = "lsp_document_highlight",
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    -- TypeScript 语言服务器配置（官方推荐方式）
    -- 需要 @vue/typescript-plugin 来处理 Vue 文件
    local ts_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    
    -- 查找 @vue/language-server 路径（全局安装或项目安装）
    local vue_language_server_path = vim.fn.system('npm root -g'):gsub('%s+', '') .. '/@vue/language-server'
    -- 如果全局找不到，尝试从当前项目的 node_modules 找
    if vim.fn.isdirectory(vue_language_server_path) == 0 then
      vue_language_server_path = vim.fn.getcwd() .. '/node_modules/@vue/language-server'
    end
    
    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }

    vim.lsp.config("ts_ls", {
      cmd = { "typescript-language-server", "--stdio" },
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = ts_filetypes,
      init_options = {
        hostInfo = "neovim",
        plugins = {
          vue_plugin,
        },
      },
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "none",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = false,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = false,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = false,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "none",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = false,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = false,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = false,
          },
        },
      },
    })
    vim.lsp.enable("ts_ls")

    -- Vue 语言服务器配置（官方推荐：最新版本空配置即可）
    vim.lsp.config("vue_ls", {
      cmd = { "vue-language-server", "--stdio" },
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "vue" },
    })
    vim.lsp.enable("vue_ls")

    -- gopls 配置（如果已安装）
    if vim.fn.executable("gopls") == 1 then
      vim.lsp.config("gopls", {
        cmd = { "gopls", "serve" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            analyses = {
              unusedparams = false,
              fieldalignment = false,
            },
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              compositeLiteralTypes = false,
              constantValues = false,
              functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
            staticcheck = false,
            gofumpt = true,
            buildFlags = { "-tags=integration" },
          },
        },
        init_options = {
          usePlaceholders = true,
        },
      })
      vim.lsp.enable("gopls")
    end
  end,
}

return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    -- 设置 markdown 预览的默认选项
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_open_ip = ''
    vim.g.mkdp_browser = ''
    vim.g.mkdp_echo_preview_url = 0
    vim.g.mkdp_page_title = '「${name}」'
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_theme = 'dark'
  end,
  config = function()
    -- 插件加载后的配置
    vim.g.mkdp_port = ''
    vim.g.mkdp_browserfunc = ''
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    ensure_installed = { "bash", "go", "lua", "markdown_inline", "vim", "vimdoc" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.opt_local.foldmethod = "expr"
        end
      end,
    })
  end,
}

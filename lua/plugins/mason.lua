return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "goimports",
      "gopls",
      "json-lsp",
      "rust-analyzer",
      "clangd",
      "css-lsp",
      "svelte-language-server",
      "pyright",
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
      autoformat = true,
      ensure_installed = {
        "clangd",
        "pyright",
        "jsonls",
      },
    },
  },
}

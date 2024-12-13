if true then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      ensure_installed = {
        "clangd",
        "jsonls",
      },
    },
  },
}

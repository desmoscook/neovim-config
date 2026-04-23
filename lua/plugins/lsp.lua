return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                },
              }
            },
          },
        }
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

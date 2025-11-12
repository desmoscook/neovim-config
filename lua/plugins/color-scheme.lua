return {
  { "sainnhe/gruvbox-material" },
  { "ellisonleao/gruvbox.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "navarasu/onedark.nvim" },
  { "sainnhe/everforest" },
  {
    "sainnhe/everforest",
    config = function()
      -- 设置 everforest 背景透明
      -- vim.g.everforest_transparent_background = 1
      vim.g.everforest_background = "hard"
    end,
  },
  { "Mofiqul/dracula.nvim" },
  -- { "folke/tokyonight.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "rose-pine/neovim" },
  { "marko-cerovac/material.nvim" },
  -- { "catppuccin/nvim" },
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },
  { "EdenEast/nightfox.nvim" },
  { "nordtheme/vim" },

  {
    "LazyVim/LazyVim",
    opts = {

      -- colorscheme = "everforest",

      -- colorscheme = "rose-pine-moon",

      -- colorscheme = "gruvbox-material",
      -- gruvbox_material_background = "hard",

      -- colorscheme = "catppuccin-frappe",

      colorscheme = "nordfox",

      -- colorscheme = "nord",

      -- colorscheme = "gruvbox",
    },
  },
}

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.winbar = "%=%m %f"
opt.spell = false -- 关闭拼写检查
opt.wrap = true
opt.relativenumber = true

-- 使用 · 显示空白字符
opt.list = true
opt.listchars = { space = "·" }

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.winbar = "%=%m %f"
opt.spell = false -- 关闭拼写检查

-- font
opt.guifont = "ComicShannsMono Nerd Font:h12"


-- 自动换行
opt.wrap = true
opt.textwidth = 80

opt.relativenumber = true

-- 保持光标居中
opt.scrolloff = 999

-- 使用 · 显示空白字符
opt.list = true
opt.listchars = { space = "·" }

vim.g.autoformat = false

-- enable nvim copy from remote server(nvim version should more than 0.10.0)
-- force nvim use osc52 when copy
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

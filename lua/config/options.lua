-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.winbar = "%=%m %f"
opt.spell = false -- 关闭拼写检查

-- font
opt.guifont = "RecMonoCasual Nerd Font"

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

-- 设置 mida 文件类型为 cuda
vim.filetype.add({
  extension = {
    mida = "cuda",
  },
})

-- enable nvim copy from remote server(nvim version should more than 0.10.0)
-- force nvim use osc52 when copy
-- config if terminal not support read from clipboard
if os.getenv "SSH_CLIENT" ~= nil or os.getenv "SSH_TTY" ~= nil then
    local function my_paste(_)
        return function(_)
            local content = vim.fn.getreg '"'
            return vim.split(content, "\n")
        end
    end

    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy "+",
            ["*"] = require("vim.ui.clipboard.osc52").copy "*",
        },
        paste = {
            ["+"] = my_paste "+",
            ["*"] = my_paste "*",
        },
    }
end

-- parse jenkinsfile as groovy
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"Jenkinsfile", "*Jenkinsfile*"},
    command = "set filetype=groovy"
})

-- 控制文本的隐藏级别
-- default is 3
-- obsidian use 1 or 2
vim.opt.conceallevel = 1


-- 为 Markdown 文件设置特定的缩进
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.tabstop = 4      -- 一个 Tab 显示为 4 个空格宽度
    vim.opt_local.shiftwidth = 4   -- 自动缩进时使用 4 个空格
    vim.opt_local.softtabstop = 4  -- 按 Tab 键插入 4 个空格
    vim.opt_local.expandtab = true -- 将 Tab 转换为空格
    vim.opt_local.spell = false    -- 关闭拼写检查
    vim.diagnostic.enable(false)   -- 关闭诊断
  end,
})

-- 在文件末尾或其他合适的位置添加
vim.cmd([[
  " 设置折叠行的高亮样式
  hi Folded cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
]])

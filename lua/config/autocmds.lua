-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local org_priority_hls = {}

local function update_org_priority_hls()
  local ok, config = pcall(require, "orgmode.config")
  if not ok then
    return
  end

  org_priority_hls = {}
  for letter, priority_config in pairs(config:get_priorities()) do
    org_priority_hls[letter] = priority_config.hl_group
  end
end

local function org_priority_hl(priority, base_hl)
  local letter = priority:match("^%[#(.)%]$")
  if not letter then
    return base_hl
  end

  local priority_hl = org_priority_hls[letter]
  if priority_hl then
    return { base_hl, priority_hl }
  end

  return base_hl
end

function _G.OrgPrettyFoldText()
  local line = vim.fn.getline(vim.v.foldstart)

  local stars, heading = line:match("^(%*+)%s*(.*)$")
  if stars then
    local level = math.min(#stars, 8)
    local headline_hl = "@org.headline.level" .. level
    local chunks = {
      { string.rep(" ", math.max(#stars - 1, 0)), "Normal" },
      { "* ", headline_hl },
    }

    local keyword_hls = {
      TODO = "@org.keyword.todo",
      DOING = "@org.keyword.face.DOING",
      DONE = "@org.keyword.face.DONE",
    }
    local keyword, rest = heading:match("^(%S+)%s+(.*)$")
    local keyword_hl = keyword and keyword_hls[keyword]
    if keyword_hl then
      table.insert(chunks, { keyword, keyword_hl })
      table.insert(chunks, { " ", headline_hl })
      heading = rest
    end

    local priority, rest_after_priority = heading:match("^(%[#.%])%s*(.*)$")
    if priority then
      table.insert(chunks, { priority, org_priority_hl(priority, headline_hl) })
      table.insert(chunks, { " ", headline_hl })
      heading = rest_after_priority
    end

    local checkbox, rest_after_checkbox = heading:match("^(%[[ Xx%-]%])%s*(.*)$")
    if checkbox then
      local checkbox_hl = checkbox:lower() == "[x]" and "@org.checkbox.checked" or "@org.checkbox"
      table.insert(chunks, { checkbox, checkbox_hl })
      table.insert(chunks, { " ", headline_hl })
      heading = rest_after_checkbox
    end

    table.insert(chunks, { heading .. " ...", headline_hl })
    return chunks
  end

  local drawer = line:match("^%s*(:%S+:%s*)$")
  if drawer then
    local parent_indent = ""
    for lnum = vim.v.foldstart - 1, 1, -1 do
      local parent_stars = vim.fn.getline(lnum):match("^(%*+)%s+")
      if parent_stars then
        parent_indent = string.rep(" ", #parent_stars)
        break
      end
    end
    return {
      { parent_indent, "Normal" },
      { drawer, "@org.drawer" },
      { " ...", "Normal" },
    }
  end

  return {
    { line, "Normal" },
    { " ...", "Normal" },
  }
end

local function org_visuals()
  update_org_priority_hls()

  vim.api.nvim_set_hl(0, "Folded", {
    bg = "NONE",
  })
  vim.api.nvim_set_hl(0, "FoldColumn", {
    bg = "NONE",
  })

  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })

  if normal.bg then
    vim.api.nvim_set_hl(0, "@org.leading_stars", {
      fg = string.format("#%06x", normal.bg),
      bg = "NONE",
    })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nc"
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.foldtext = "v:lua.OrgPrettyFoldText()"
    org_visuals()
  end,
})

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = org_visuals,
})

-- 在 markdown 文件中禁用语法检查（诊断/linting）
local function disable_markdown_checks(args)
  vim.opt_local.spell = false
  vim.diagnostic.enable(false, { bufnr = args.buf })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = disable_markdown_checks,
})

-- autocmds.lua 在 VeryLazy 时加载，需同时处理启动时已经打开的文件。
if vim.bo.filetype == "markdown" or vim.bo.filetype == "markdown.mdx" then
  disable_markdown_checks({ buf = vim.api.nvim_get_current_buf() })
end

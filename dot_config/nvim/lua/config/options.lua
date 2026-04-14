-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.fileencodings = { "ucs-bom", "utf-8", "euc-jp", "cp932" }

-- Editing
vim.g.autoformat = false

-- Display
vim.opt.relativenumber = false
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "･",
  nbsp = "⍽",
  extends = "»",
  precedes = "«",
  eol = "↲",
}
vim.opt.showmatch = true
vim.opt.background = "dark"

-- Key behaviour
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = { "indent", "eol", "start" }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Misc
vim.opt.wildmenu = true
vim.opt.history = 5000
vim.opt.backup = false

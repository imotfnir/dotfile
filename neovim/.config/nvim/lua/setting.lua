local g = vim.g
local o = vim.o

-- UI setting
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorcolumn = true
o.ruler = true

-- indent setting
o.smarttab = true
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true

-- search setting
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true
o.tags = "./tags,tags,./.tags,.tags;"

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- other setting
o.fileencodings = "utf-8,big5"
o.mouse = 'a'
o.history = 1000
o.listchars = "eol:↓,tab:→·,trail:~,extends:>,precedes:<,space:·"
o.list = true

vim.cmd([[
filetype indent on
syntax enable
]])


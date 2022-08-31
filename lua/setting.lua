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
o.tags = "./tags,tags;"

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- other setting
o.fileencodings = "utf-8,big5"
o.history = 1000
o.mouse = a

vim.cmd([[
filetype indent on
syntax enable
]])

-- Override text color
vim.cmd([[
highlight Whitespace ctermfg=NONE guifg=#49ffe7
highlight Nontext ctermfg=NONE guifg=#49ffe7
]])
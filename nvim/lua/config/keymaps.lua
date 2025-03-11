vim.o.timeoutlen = 1000

local bind = vim.keymap.set
local opts = { noremap = true, silent = false }

bind("n", "<C-w>t", ":NvimTreeToggle<CR>", opts)

-- copy to system clipboard
bind('n', '<C-c>', '"+y', opts)
bind('v', '<C-c>', '"+y', opts)

-- save file
bind('n', '<C-s>', ':w<CR>', opts)
bind('v', '<C-s>', ':w<CR>', opts)

-- split windows
bind('n', '<C-w>|', '<cmd>vsplit<CR>', opts)
bind('n', '<C-w>_', '<cmd>split<CR>', opts)

-- CRLF, LF
bind("n", "<Leader>cr", ":%s/\\r\\n/CRLF/g<CR>", opts)
bind("n", "<Leader>lf", ":%s/\\n/LF/g<CR>", opts)

-- resize window
bind('n', '<C-w>+', '<cmd>resize +3<CR>', opts)
bind('n', '<C-w>-', '<cmd>resize -3<CR>', opts)
bind('n', '<C-w>>', '<cmd>vertical resize +6<CR>', opts)
bind('n', '<C-w><', '<cmd>vertical resize -6<CR>', opts)


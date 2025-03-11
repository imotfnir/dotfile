vim.o.timeoutlen = 2000

local bind = vim.keymap.set
local opts = { noremap = true, silent = false }


-- ============= Basic Keymaps =============
-- copy to system clipboard
bind('n', '<C-c>', '"+y', opts)
bind('v', '<C-c>', '"+y', opts)

-- save file
bind('n', '<C-s>', '<cmd>w<CR>', opts)
bind('v', '<C-s>', '<cmd>w<CR>', opts)

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

-- tab quick swich
bind('n', '<leader>th', '<CMD>tabfirst<CR>', opts)
bind('n', '<leader>tl', '<CMD>tablast<CR>', opts)
bind('n', '<leader>tj', '<CMD>tabnext<CR>', opts)
bind('n', '<leader>tk', '<CMD>tabprev<CR>', opts)
bind('n', '<leader>te', '<CMD>tabedit<CR>', opts)

-- select all text
bind('n', '<C-k><C-a>', 'ggVG', opts)


-- ============= Plugin Keymaps =============

bind("n", "<C-w>t", "<cmd>NvimTreeToggle<CR>", opts)
bind("n", "<leader>f", "<cmd>Telescope<CR>", opts)

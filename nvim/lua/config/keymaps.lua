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

-- resize window
bind('n', '<C-w>+', '<cmd>resize +3<CR>', opts)
bind('n', '<C-w>-', '<cmd>resize -3<CR>', opts)
bind('n', '<C-w>>', '<cmd>vertical resize +6<CR>', opts)
bind('n', '<C-w><', '<cmd>vertical resize -6<CR>', opts)

-- tab quick swich
bind('n', '<leader>tt', '<cmd>tabs<CR>', opts)
bind('n', '<leader>th', '<cmd>tabfirst<CR>', opts)
bind('n', '<leader>tl', '<cmd>tablast<CR>', opts)
bind('n', '<leader>tj', '<cmd>tabnext<CR>', opts)
bind('n', '<leader>tk', '<cmd>tabprev<CR>', opts)
bind('n', '<leader>te', '<cmd>tabedit<CR>', opts)

-- select all text
bind('n', '<C-k><C-a>', 'ggVG', opts)

-- Motion
bind('n', 'H', '^', opts)
bind('n', 'L', '$', opts)
bind('n', 'J', '<C-d>', opts)
bind('n', 'K', '<C-u>', opts)

-- ============= Plugin Keymaps =============

bind("n", "<C-w>t", "<cmd>NvimTreeToggle<CR>", opts)
-- bind("n", "<leader>ff", "<cmd>Telescope<CR>", opts)
-- bind("n", "<leader>fc", "<cmd>Telescope commands<CR>", opts)
-- bind("n", "<leader>fgst", "<cmd>Telescope git_status<CR>", opts)
-- bind("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>", opts)
-- bind("n", "<leader>fm", "<cmd>Telescope man_pages<CR>", opts)
-- bind("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
-- bind("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", opts)

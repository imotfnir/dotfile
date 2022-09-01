local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Move cell
map('n', '<A-j>', '<CMD>move .+1<CR>')
map('n', '<A-k>', '<CMD>move .-2<CR>')
map('i', '<A-j>', '<Esc>:m .+1<CR>gi')
map('i', '<A-k>', '<Esc>:m .-2<CR>gi')
map('v', '<A-j>', ":move '>+1<CR>gv")
map('v', '<A-k>', ":move '<-2<CR>gv")

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- Save file
map('n', '<C-s>', '<CMD>w<CR>')
map('i', '<C-s>', '<Esc><CMD>w<CR>')

-- leader-o/O inserts blank line below/above
map('n', 'o', 'o<ESC>')
map('n', 'O', 'O<ESC>')

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-w>-', '<CMD>vsplit<CR>')
map('n', '<C-w>_', '<CMD>split<CR>')
map('n', '<C-w>x', '<C-w>c')

-- Plugin keybinds
map('n', '<F2>', '<CMD>Neotree toggle<CR>')
map('n', '<F3>', '<CMD>TagbarToggle<CR>')

-- ctags
map('n', '<C-[>', '<C-t>')

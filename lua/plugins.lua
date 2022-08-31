-- Import Plugin Config
require('other_plugins.init')

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- My customized setting
vim.cmd([[
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set formatoptions+=r
set hlsearch
set viminfo='20,\"1000"
set fileencodings=utf-8,big5
set history=1000
set ruler
set mouse=a
set softtabstop=4
set smarttab
set expandtab
set tags=./tags,tags;
set ignorecase
set smartcase
set incsearch
set cursorline
set cursorcolumn
filetype indent on
syntax enable

]])

-- My Keymapping
vim.cmd([[
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
]])

-- Color schemes setting
require('other_plugins.nightfox')

-- My text color
vim.cmd([[
highlight Whitespace ctermfg=NONE guifg=#49ffe7
highlight Nontext ctermfg=NONE guifg=#49ffe7
]])


-- Import Plugin
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- You add plugins here
  use "EdenEast/nightfox.nvim" -- Packer
  use "nvim-treesitter/nvim-treesitter"
  use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
  use "terryma/vim-multiple-cursors" -- CTRL·+·N·for·multiple·cursors
  use "ntpeters/vim-better-whitespace" -- Whitespace characters highlighted
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    } -- Browse the file system
end)



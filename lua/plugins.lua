require('other_plugins')

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

-- Customized setting
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

-- Keymapping
vim.cmd([[
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
]])


-- Color schemes setting
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})
-- setup must be called before loading
vim.cmd([[colorscheme terafox]])

vim.cmd [[packadd packer.nvim]]
-- All Plugin Config
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- You add plugins here  
  use "EdenEast/nightfox.nvim" -- Packer
  use "nvim-treesitter/nvim-treesitter"
  use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
end)



lua require('plugins')

:let g:rainbw_active=1
" :set number
" :set relativenumber
" :set autoindent
" :set tabstop=4
" :set shiftwidth=4
" :set formatoptions+=r
" :set hlsearch
" :set viminfo='20,\"1000"
" :set fileencodings=utf-8,big5
" :set history=1000
" :set ruler
" :set mouse=a
" :set softtabstop=4
" :set smarttab
" :set expandtab
" :set tags=./tags,tags;
" :set ignorecase
" :set smartcase
" :set incsearch
" filetype indent on
" syntax enable

" :let mapleader = " "

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/junegunn/goyo.vim' "goyo centering the code 
Plug 'https://github.com/justmao945/vim-clang'
Plug 'https://github.com/aphroteus/vim-uefi'
Plug 'https://github.com/lemonade-command/lemonade'
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/Xuyuanp/scrollbar.nvim'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

set encoding=UTF-8

call plug#end()



" keymap
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F4> :TerminalSplit zsh<CR> 

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" cscope
:if !empty(glob("cscope.out"))
:   cscope add cscope.out
:endif


" bash support
let g:LanguageClient_serverCommands = {'sh': ['bash-language-server', 'start']}
let g:python3_host_prog = '/home/baopang/anaconda3/bin/python'
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
      \      '*': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
      \    },
      \   'paste': {
      \      '+': {-> get(g:, 'foo', [])},
      \      '*': {-> get(g:, 'foo', [])},
      \   },
      \ }



" setting
" :colorscheme molokai
" :let g:rainbow#max_level = 16
" :let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]
" cursor
:set cursorline
:set cursorcolumn

" show whitespace
:set listchars=eol:↓,tab:→·,trail:~,extends:>,precedes:<,space:·
:set list

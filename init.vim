lua require('init')
lua require('plugins')
lua require('keybinds')
lua require('autocmd')
lua require('setting')

:let g:rainbw_active=1

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/junegunn/goyo.vim' "goyo centering the code
Plug 'https://github.com/justmao945/vim-clang'
Plug 'https://github.com/aphroteus/vim-uefi'
Plug 'https://github.com/lemonade-command/lemonade'
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/Xuyuanp/scrollbar.nvim'
Plug 'https://github.com/jiangmiao/auto-pairs'

set encoding=UTF-8

call plug#end()

" vscode support
if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif

" keymap
nnoremap <F2> :Neotree<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F4> :TerminalSplit zsh<CR>

" cscope
:if !empty(glob("cscope.out"))
:   cscope add cscope.out
:endif


" setting
" cursor
:set cursorline
:set cursorcolumn

" show whitespace
:set listchars=eol:↓,tab:→·,trail:~,extends:>,precedes:<,space:·
:set list

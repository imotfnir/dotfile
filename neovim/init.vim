lua require('init')
lua require('plugins')
lua require('autocmd')
lua require('setting')
lua require('keybinds')

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

call plug#end()


runtime ./vim_script/coc.vim

" vscode support
if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif

" cscope
:if !empty(glob("cscope.out"))
:   cscope add cscope.out
:endif



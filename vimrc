set nocompatible                " no compatibility with legacy vi

colorscheme solarized
"" set background=dark

let g:airline_powerline_fonts = 1
"" let g:airline_solarized_bg = 'dark'

syntax enable
set ruler
set cursorline
set number
set laststatus=2
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

vnoremap . :norm.<CR>           " use dot to repeat in visual mode

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is 4 spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everying in insert mode
autocmd BufWritePre *.py :%s/\s\+$//e  " trim trailing whitespace on save

"" Searching
set hlsearch                    " highlight matches (:noh cancels hl for current search)
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ...unless they contain at least one uppercase letter

"" Security
set modelines=0
set nomodeline

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

"  .vimrc
"  
"  
"         ___                       ___     
"        /\__\          ___        /\__\    
"       /:/  /         /\  \      /::|  |   
"      /:/  /          \:\  \    /:|:|  |   
"     /:/__/  ___      /::\__\  /:/|:|__|__ 
"     |:|  | /\__\  __/:/\/__/ /:/ |::::\__\
"     |:|  |/:/  / /\/:/  /    \/__/~~/:/  /
"     |:|__/:/  /  \::/__/           /:/  / 
"      \::::/__/    \:\__\          /:/  /  
"       ~~~~         \/__/         /:/  /   
"                                  \/__/    


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Disable arrow keys in Normal mode
"no <Up> <Nop>
"no <Down> <Nop>
"no <Left> <Nop>
"no <Right> <Nop>

"Disable arrow keys in Insert mode
"ino <Up> <Nop>
"ino <Down> <Nop>
"ino <Left> <Nop>
"ino <Right> <Nop>

:set number
:set rnu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set nobackup
set noswapfile
:filetype plugin on
:filetype indent on
syntax on

"set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=\ %=
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %c
set statusline+=\ %y
set statusline+=\ %m
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] "file encoding

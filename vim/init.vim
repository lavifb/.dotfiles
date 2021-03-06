set nocompatible              " be iMproved, required
filetype on

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" File browser tab
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Comment shortcut
Plug 'tomtom/tcomment_vim'

" git plugin
Plug 'tpope/vim-fugitive'

" pretty status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set noshowmode

set t_Co=256		" 256 color terminal
set number		" line numbers
set softtabstop=4	" number of columns tabs count for
set shiftwidth=4	" number of columns indented with << and >>
set backspace=2		" make backspce work like most other apps
set pastetoggle=<F2>	" allows text to be pasted with original alignment
set autoindent		" indents each line the same as the previous one
"set cindent		" indents according to C indentation standard, should not be used with smartindent
set smartindent		" automatically inserts one extra level of indentation
set incsearch		" search as string is typed
set ignorecase		" ignore case on search
set shortmess=atI	" short messages and don't show intro
set showcmd		" shows normal mode key presses at bottom
set confirm		" dialog asking to confirm things instead of error
set wildmenu		" menu pops up for tab completion on commands
set ruler		" show current position at bottm
filetype indent on	" enable loading indent file for specific files
syntax on		" turn on syntax highlighting
set mouse=a		" turn on mouse support

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" vim-airline
let g:airline_powerline_fonts = 1

" tcomment-vim
" map <Cmd

" Colors - {{
" Explanation of 256 colors and vim: http://www.frexx.de/xterm-256-notes/
" vim color names: http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" thread that helped me choose the color for hi CursorLine: http://tech.groups.yahoo.com/group/vim/message/105727
" choosing colors: http://colorschemedesigner.com/
let base16colorspace=256  " Access colors present in 256 colorspace
colo base16-tomorrow-night
let g:airline_theme='base16_shell'

" line highlighting
" hi CursorLine cterm=None ctermbg=235
" set cursorline!
" hi CursorColumn cterm=None ctermbg=235
" set cursorcolumn!


" wildmenu colors
"hi WildMenu cterm=None ctermbg=black ctermfg=2
"hi StatusLine term=reverse ctermfg=0 ctermbg=white gui=bold,reverse
" }}

" Key adjusts - {{
imap jj <Esc>	" detect down movement in insert mode
imap kk <Esc>	" detect up movement in insert mode

" make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"use Enter to insert new lines
map <CR> o<Esc>k

" use Space to add spaces in cmd mode
map <Space> i<Space><Esc>

nmap J }
nmap K {
" }}

" Backups - {{
" must create these directories first!
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" }}

cmap w!! w !sudo tee >/dev/null %

" Tips - {{
" H M L - high middle low of current screen
" ^ - first non-blank character
" n% - go to n percent of file
" E, B, W - strict word definitions
" ctrl n - word completion
" >i{ indent block in
" <i{ decrease indent
" :Sex - really? but it's seriously useful
" f F - find occurrence
" t T - like f, except till one char before occurrence
" , - next occurrence of f, t
" ; - previous occurrence of f, t
" ctrl L - redraw screen
" }}

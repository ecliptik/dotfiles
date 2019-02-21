set nocompatible      " We're running Vim, not Vi!
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
filetype indent plugin on

set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set autoindent
set smartindent
set nocompatible
set modeline
set modelines=10
set number
set hlsearch

" Show no-printable chars
set list
set listchars=tab:▸\ ,eol:\ 

hi ExtraWhitespace ctermbg=cyan guibg=cyan
match ExtraWhitespace /\s\+$/
match ExtraWhitespace /\t/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd! BufRead,BufNewFile *.json set filetype=json
autocmd! BufRead,BufNewFile *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown

set statusline+=%F
set laststatus=2

au FileType markdown setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et norelativenumber nocursorline
au FileType python setl ts=8 et sw=4 sts=4 norelativenumber nocursorline

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

"Highlight current line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
hi CursorLine guibg=#303000 ctermbg=234

"Search Highlight
hi Search cterm=NONE ctermfg=white ctermbg=magenta

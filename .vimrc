syntax on
filetype indent plugin on
filetype plugin on

set background=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set expandtab
set showmatch
set autoindent
set smartindent
set nocompatible
set modeline
set modelines=10
set number

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd! BufRead,BufNewFile *.json set filetype=json
autocmd! BufRead,BufNewFile *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown

set statusline+=%F
set laststatus=2

au FileType markdown setl sw=2 sts=2 et

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

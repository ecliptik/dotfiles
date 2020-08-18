" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number

"Highlight current line
set cursorline
hi cursorline cterm=none term=none

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set statusline+=%F\ %l\:%c
set ruler
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /
vnoremap / /
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remove arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set list
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd! BufRead,BufNewFile *.json set filetype=json
autocmd! BufRead,BufNewFile *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown

" map ctrl-c for visual copy
map <C-c> "+y<CR>
vnoremap s/ y:s/<c-r>/

" Color scheme (terminal)
set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans = 1 "
colorscheme solarized

" Vim visual search/replace
" https://www.reddit.com/r/vim/comments/19sm9v/replace_all_instances_of_currently_highlighted/
" Select visual, use * to select all in file, then :%s//TEXT_TOREPLACE/g
"
let s:screen  = &term =~ 'screen'
let s:tmux = &term =~ 'tmux'
let s:xterm   = &term =~ 'xterm'

" make use of Xterm "bracketed paste mode"
" https://cirw.in/blog/bracketed-paste
if s:screen || s:xterm || s:tmux
  function! s:BeginXTermPaste(ret)
    set paste
    return a:ret
  endfunction

  " enable bracketed paste mode on entering Vim
  let &t_ti .= "\e[?2004h"

  " disable bracketed paste mode on leaving Vim
  let &t_te = "\e[?2004l" . &t_te

  set pastetoggle=<Esc>[201~
  inoremap <expr> <Esc>[200~ <SID>BeginXTermPaste("")
  nnoremap <expr> <Esc>[200~ <SID>BeginXTermPaste("i")
  vnoremap <expr> <Esc>[200~ <SID>BeginXTermPaste("c")
  cnoremap <Esc>[200~ <nop>
  cnoremap <Esc>[201~ <nop>
endif

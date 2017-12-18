if &compatible
  set nocompatible
endif
set encoding=utf-8
scriptencoding utf-8

" File format
set fileformats=unix,dos,mac
set fileencodings=ucs-boms,utf-8,euc-jp,cp932

" Display
set ambiwidth=double
syntax on
set number
set list
set listchars=tab:»\ ,trail:･,nbsp:⍽,extends:»,precedes:«,eol:↲
set showmatch
set tabstop=4
set shiftwidth=4
set cursorline
set laststatus=2

" Key behavior
set noexpandtab
set autoindent
set smartindent
set backspace=indent,eol,start

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Others
set wildmenu
set history=5000
set nobackup

" Highlight full width spaces
highlight FullWidthSpace ctermbg=LightCyan
match FullWidthSpace /　/

" <Esc><Esc> to toggle search highlight
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" Paste
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" Enable mouse
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif


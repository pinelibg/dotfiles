set encoding=utf-8
scriptencoding utf-8

if &compatible
  set nocompatible
endif

" File format
set fileformats=unix,dos,mac
set fileencodings=ucs-boms,utf-8,euc-jp,cp932

" Display
set number
set list
set listchars=tab:»\ ,trail:･,nbsp:⍽,extends:»,precedes:«,eol:↲
set showmatch
set tabstop=4
set shiftwidth=4
set cursorline
set laststatus=2
set background=dark
if (has("termguicolors"))
  set termguicolors
endif
"set ambiwidth=double
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

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
set updatetime=300

" Highlight full width spaces
highlight FullWidthSpace ctermbg=LightCyan
match FullWidthSpace /　/

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
  if !has('nvim')
    if has('mouse_sgr')
      set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
      set ttymouse=sgr
    else
      set ttymouse=xterm2
    endif
  endif
endif

" Key Mapping
let mapleader="," " <Leader> -> ',' key

" jj to exit insert mode
inoremap <silent> jj <Esc>
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>
inoremap <silent> ｊｊ <ESC>

augroup MyAutoCmd
  autocmd!
augroup END

" dein requires Vim 8.0 or above, or NeoVim
if has('neovim') || v:version >= 800
  let s:cache_dir = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
  let s:dein_dir = s:cache_dir . '/dein'
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif
  let &runtimepath = s:dein_repo_dir .",". &runtimepath

  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = fnamemodify(expand('<sfile>'), ':h')
    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
  endif

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif

  call dein#call_hook('source')
  autocmd VimEnter * call dein#call_hook('post_source')

endif

filetype plugin indent on
syntax enable


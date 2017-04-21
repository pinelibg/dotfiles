set nocompatible
set fileformats=unix,dos,mac
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set ambiwidth=double
set ignorecase
set smartcase
set hlsearch
set incsearch
set number
set list
set showmatch
syntax on
set mouse=a
set ttymouse=xterm2
set tabstop=4
set shiftwidth=4
set noexpandtab

"For cygwin
set backspace=indent,eol,start

"行頭のスペースの連続をハイライトさせる
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
    syntax match SOLSpace "^\s\+" display containedin=ALL
    highlight SOLSpace term=underline ctermbg=LightGray
endf
"行末スペースのハイライト
function! EOLSpaceHilight()
    syntax match EOLSpace "\s\+$" display containedin=ALL
    highlight EOLSpace term=underline ctermbg=LightGray
endf
"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "　" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf
"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
    syntax on
        augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call SOLSpaceHilight()
        autocmd BufNew,BufRead * call EOLSpaceHilight()
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif

"特殊文字(SpecialKey)の可視化。listcharsはlcsでも設定可能。
set list
set listchars=tab:»\ ,nbsp:%,extends:»,precedes:«,eol:↲

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

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


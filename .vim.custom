" Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>

nnoremap <Space>h ^
nnoremap <Space>l $
vnoremap <Space>h ^
vnoremap <Space>l $

" ==================================================
" タブ
" ==================================================
nnoremap gf <C-w>gf
nnoremap gr gT

" ==================================================
" 削除・ヤンク
" ==================================================
" 通常のx, d, Dではヤンクせず、yをつけた時だけヤンクするように
nnoremap yx x
nnoremap yd d
nnoremap yD D
vnoremap yx x
vnoremap yd d
vnoremap yD D

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap x "_x
vnoremap d "_d
vnoremap D "_D

" Yで行末までコピーする
nnoremap Y y$

" ==================================================
" インデント
" ==================================================
" <TAB>キーでインデントする<Tab>と<C-i>が同一視されるため回避している
nnoremap <TAB> >>
nnoremap \<C-i> <C-i>
vnoremap <TAB> >>
vnoremap \<C-i> <C-i>

" ==================================================
" 数字を選択し、自動的にインクリメントする
" ==================================================
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

" ==================================================
" オプション
" ==================================================
" シンタックスハイライトを有効にする
syntax on
" インサートモードでバックスペースを有効にする
set backspace=indent,eol,start
" 折り畳み文字を有効化
set foldmethod=marker
" インデント
set autoindent
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
" 行数表示
set number
" 行の端までいっても折り返さない
set nowrap
" クリップボードの有効化
set clipboard+=unnamed
" 横にスクロールする際の移動量
set sidescroll=1
" Vimの外部で変更されたことが判明したとき、自動的に読み直す
set autoread
" 索対象をハイライトする
set hlsearch
" インクリメント検索
set incsearch
" 大文字と小文字を区別しない
set ignorecase
" 大文字が含まれる場合のみ大文字小文字を区別する
set smartcase
" 置換時、同一行に対象の文字列があれば置換を行う
set gdefault
" マウスの有効化
set mouse=a
" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
" 常にタブラインを表示
set showtabline=2
" スクロールが始まるまでの残り行数を設定
set scrolloff=10
" swapファイルを作成しない
set noswapfile
" synax highlight する横幅を設定(高速化のため)
set synmaxcol=120

" ファイル保存時に行末の不要な空白を取り除く
augroup DeleteTailSpace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END

" ==================================================
" ファイル識別設定
" ==================================================
augroup SetFileType
  autocmd!
  autocmd BufRead,BufNewFile *.ts  set filetype=typescript
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript
augroup END

" ==================================================
" インデント
" ==================================================
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.ts  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" ==================================================
" タブラインの設定
" ==================================================
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no  = getbufvar(bufnr, '&modified') ? i : ' ' . i
    let mod = getbufvar(bufnr, '&modified') ? '+ ' : ''
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = title . ' '
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= mod
    let s .= no . ':' . title
    let s .= '%#TabLineFill#'
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" ==================================================
" 全角スペースをハイライト表示
" ==================================================
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


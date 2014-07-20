" プラグインの読み込み
if filereadable(expand("$HOME/dotfile/.vimrc.plugin")) 
	source $HOME/dotfile/.vimrc.plugin
endif

" ハイライトの設定
if filereadable(expand("$HOME/dotfile/.vimrc.highlight")) 
	source $HOME/dotfile/.vimrc.highlight
endif

" 魔法の設定
set nocompatible

" インサートモードでバックスペースを有効にする
set backspace=indent,eol,start

nnoremap : ;
nnoremap ; :

" インデント
set autoindent
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" 行数表示
set number

" 行の端までいっても折り返さない
set nowrap

" クリップボードの有効化
" だけどclipboard有効状態でコンパイルできていないので意味がない！
set clipboard+=autoselect
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

" 大文字が含まれる場合のみ大文字小文字を区別する。
set smartcase

" 置換時、同一行に対象の文字列があれば置換を行う
set gdefault

" マウスの有効化
set mouse=a

syntax on

"Enterでいつでも一行挿入
" map <S-Enter> O<ESC>
" map <Enter> o<ESC>

" インサートモードでjjとうつとEscできる！
inoremap <silent> jj <Esc>

" 移動系
nnoremap <Space>h  ^
nnoremap <Space>l  $
nnoremap <C-h> 3h
nnoremap <C-k> 3k
nnoremap <C-l> 3l
nnoremap <C-j> 3j

vnoremap <C-h> 3h
vnoremap <C-k> 3k
vnoremap <C-l> 3l
vnoremap <C-j> 3j

" タブ
nnoremap gr gT

" %でif-endやhtmlタグの最初と最後
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" タブラインの設定
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
function! s:my_tabline()  "{{{
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
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" 環境によって変える設定を記述する
" 設定を上書きするために一番最後に読み込む
if filereadable(expand("$HOME/dotfile/.vimrc.enviroment")) 
	source $HOME/dotfile/.vimrc.enviroment
endif


" プラグインの読み込み
if filereadable(expand("$HOME/dotfile/.vimrc.plugin")) 
	source $HOME/dotfile/.vimrc.plugin
endif

" ハイライトの設定
if filereadable(expand("$HOME/dotfile/.vimrc.highlight")) 
	source $HOME/dotfile/.vimrc.highlight
endif

" 環境によって変える設定を記述する
if filereadable(expand("$HOME/dotfile/.vimrc.enviroment")) 
	source $HOME/dotfile/.vimrc.enviroment
endif

" 魔法の設定
set nocompatible
" インサートモードでバックスペースを有効にする
set backspace=indent,eol,start
set autoindent
set number
set nowrap
set tabstop=2
set shiftwidth=2
set clipboard+=autoselect
set clipboard+=unnamed
set tabline=tabline-layout  
" 横にスクロールする際の移動量
set sidescroll=1
" Vimの外部で変更されたことが判明したとき、自動的に読み直す
set autoread
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set mouse=a

syntax on

"Enterでいつでも一行挿入
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" 移動系
noremap <Space>h  ^
noremap <Space>l  $
noremap <C-h> 3h
noremap <C-j> 3j
noremap <C-k> 3k
noremap <C-l> 3l

" %でif-endやhtmlタグの最初と最後
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" タブ
nnoremap gr gT

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


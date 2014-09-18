" シンタックスハイライトを有効にする
syntax on
" 魔法の設定
set nocompatible
" インサートモードでバックスペースを有効にする
set backspace=indent,eol,start
" 折り畳み文字を有効化
set foldmethod=marker
" インデント
set autoindent
set expandtab
set tabstop=2 shiftwidth=2
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
" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
" 常にタブラインを表示
set showtabline=2

" ファイル保存時に行末の不要な空白を取り除く
autocmd BufWritePre * :%s/\s\+$//ge

" CoffeeScriptのファイルにはjsのシンタックスハイライトを利用する
autocmd BufRead,BufNewFile *.coffee set ft=javascript syntax=javascript
" lessのファイルにはcssのシンタックスハイライトを利用する
autocmd BufRead,BufNewFile *.less set ft=css syntax=css

" タブラインの設定 " {{{
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
" }}}

" 全角スペースをハイライト表示 "{{{
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
" }}}

" デバッグコードを削除したりマーカー文字列を付与したり " {{{
function! RemoveDebugCode()
  g/\[DEBUG_CODE\]/d
  write
endfunction

function! MarkDebugCode()
  call setline('.', getline('.').' # [DEBUG_CODE]')
endfunction

augroup RemoveDebugCode
  autocmd!
  autocmd VimLeave * call RemoveDebugCode()
  command! RemoveDebugCode :call RemoveDebugCode()
  command! MarkDebugCode :call MarkDebugCode()
augroup END

" }}}

" 数字を選択し、自動的にインクリメントする "{{{
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
" }}}

" プラグインの読み込み " {{{
if filereadable(expand("$HOME/dotfile/.vimrc.plugin"))
  source $HOME/dotfile/.vimrc.plugin
endif

" ハイライトの設定
if filereadable(expand("$HOME/dotfile/.vimrc.highlight"))
  source $HOME/dotfile/.vimrc.highlight
endif

" ハイライトの設定
if filereadable(expand("$HOME/dotfile/.vimrc.keymap"))
  source $HOME/dotfile/.vimrc.keymap
endif

" %でif-endやhtmlタグの最初と最後に移動できるようにする
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" 環境別の設定ファイルを読み込む
if filereadable(expand("$HOME/dotfile/.vimrc.enviroment"))
  source $HOME/dotfile/.vimrc.enviroment
endif
" }}}


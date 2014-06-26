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
set mouse=a
set sidescroll=1
set autoread
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

syntax on

filetype off
if has("vim_starting")
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

filetype plugin on
filetype plugin indent on " required!
filetype indent on

" プラグイン
NeoBundle 'mattn/emmet-vim'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

" 移動系
noremap <Space>h  ^
noremap <Space>l  $
noremap <C-h> 3h
noremap <C-j> 3j
noremap <C-k> 3k
noremap <C-l> 3l

" Emmet
imap <C-e> <C-y>,

" Uniteのコマンド
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,um :<C-u>Unite  file_mru <CR>
nnoremap <silent> ,urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> ,urm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> ,urv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> ,urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>

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
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" 対応する括弧の色を薄くする。
hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black
hi Visual ctermbg=Black ctermfg=LightGray
hi Pmenu ctermfg=0 ctermbg=255 guifg=BLAK guibg=Grey
hi PmenuSel ctermfg=DarkBlue ctermbg=LightGrey guifg=DarkBlue guibg=DarkGrey
hi LineNr ctermfg=3 guifg=Yellow
hi TabLine cterm=none
hi TabLineFill ctermbg=7 ctermfg=255 guibg=Grey
hi Search ctermbg=3 ctermfg=255


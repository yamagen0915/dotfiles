
" 分割した設定ファイルの読み込み
set runtimepath+=$HOME/dotfile/vim
runtime! .vimrc.*

" %でif-endやhtmlタグの最初と最後に移動できるようにする
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif


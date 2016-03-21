
" 分割した設定ファイルの読み込み
set runtimepath+=$HOME/dotfiles/vim
runtime! .vimrc.*

" ローカルファイルを読み込む
set runtimepath+=$HOME
runtime! .vimrc.local

" %でif-endやhtmlタグの最初と最後に移動できるようにする
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif


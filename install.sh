
dotfiles=(
  'vim/vimrc'
  'zsh/zshrc'
  'git/gitconfig'
  'tmux/tmux.conf'
)

function main()
{
  # 各種dotfileをインストールする
  for file in ${dotfiles[@]}; do
    install $file
  done
}

function install()
{
  echo "------ intstall ${1} to ${HOME} ------"
  # ホームディレクトリにファイルがなければ作成する
  if [ ! -e ~/`filename ${1}` ]; then
    echo "`filename ${1}`を作成します"
    ln -s ~/dotfiles/$1 ~/.`filename ${1}`
    return 0
  fi

  echo "`filename ${1}`が既に存在しています。"
  printf "新しいファイルと入れ替えますか? [Y/n] : "
  read answer
  case "$answer" in
    Y)
      echo "`filename ${1}` を `filename ${1}`.`today` へリネーム."
      mv ~/.`filename ${1}` ~/.`filename ${1}`.`today`
      echo "~/dotfiles/${1}へのシンボリックリンクを作成"
      ln -s ~/dotfiles/$1 ~/.`filename ${1}`
      ;;
    *)
      ;;
  esac
  echo ""
}

#
# パスからファイル名だけを抜き取る
#
# = Arg
# vim/.vimrc
#
# = Return
# .vimrc
#
function filename() {
  echo ${1##*/}
}

#
# 今日の日付を返す
#
# = Return
# 20150626
#
function today(){
  echo $(date +%Y%m%d)
}

# main関数の実行
main

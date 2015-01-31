
function main()
{
  make_symbolic_link './vim/.vimrc'
  make_symbolic_link './zsr/.zshrc'
  make_symbolic_link './bash/.bashrc'
  make_symbolic_link './.gitconfig'
  make_symbolic_link './.tmux.conf'
}

function make_symbolic_link()
{
  # ホームディレクトリにファイルがなければ作成する
  if [ ! -e ~/`filename ${1}` ]; then
    echo "`filename ${1}`を作成します。"
    ln -s ~/dotfiles/$1 ~/`filename ${1}`
    return 0
  fi

  echo "`filename ${1}`が既に存在します。置き換えますか?(yes or no)"
  read answer
  case "$answer" in
    yes)
      rm ~/`filename ${1}`
      ln -s ~/dotfiles/$1 ~/`filename ${1}`
      ;;
   *)
     ;;
  esac

}

function filename()
{
  file_path=$1
  echo ${file_path##*/}
}

# main関数の実行
main

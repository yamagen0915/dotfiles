
dotfiles=(
  'vim/.vimrc'
  'zsh/.zshrc'
  'bash/.bashrc'
  '.gitconfig'
  '.tmux.conf'
)

function main()
{
  for file in ${dotfiles[@]}; do
    install $file
  done
}

function install()
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

function filename() {
  echo ${1##*/}
}

# main関数の実行
main


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

  echo "------ intstall NeoBundle to ${HOME}/.vim/bundle/neobundle.vim ------"
  if [ ! -d $HOME/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
  fi

  if [ ! -d $HOME/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
  else
    echo '既にNeoBundleがインストールされています。'
  fi
}

function install()
{
  echo "------ intstall ${1} to ${HOME} ------"
  # ホームディレクトリにファイルがなければ作成する
  if [ ! -e ~/`filename ${1}` ]; then
    echo "`filename ${1}`を作成します"
    ln -s ~/dotfiles/$1 ~/`filename ${1}`
    return 0
  fi

  echo "`filename ${1}`が既に存在しています。"
  printf "新しいファイルと入れ替えますか? [Y/n] : "
  read answer
  case "$answer" in
    Y)
      echo "`filename ${1}` を `filename ${1}`.`today` へリネーム."
      mv ~/`filename ${1}` ~/`filename ${1}`.`today`
      echo "~/dotfiles/${1}へのシンボリックリンクを作成"
      ln -s ~/dotfiles/$1 ~/`filename ${1}`
      ;;
    *)
      ;;
  esac
  echo ""
}

function filename() {
  echo ${1##*/}
}

function today(){
  echo $(date +%Y%m%d)
}

# main関数の実行
main


create_file()
{
  if [ -e $HOME/$1 ]; then
    echo "${1}が既に存在します。削除してシンボリックリンクを新たに作成しますか?(yes or no)"
    read answer
    case "$answer" in
      yes)
        echo "${1}のシンボリックリンクを作成します。"
        rm $HOME/$1
        ln -s $HOME/dotfiles/$1 $HOME/$1
        ;;
     *)
       echo '中断します。'
       ;;
    esac
  else
    echo "${1}のシンボリックリンクを作成します。"
    ln -s $HOME/dotfiles/$1 $HOME/$1
  fi
}

create_file '.vimrc'
create_file '.zshrc'
create_file '.gitconfig'
create_file '.bashrc'
create_file '.tmux.conf'

echo 'NeoBundleをインストールします。'
if [ ! -d $HOME/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
fi

if [ ! -d $HOME/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
else
  echo '既にNeoBundleがインストールされています。'
fi


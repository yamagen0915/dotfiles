
create_file()
{
  if [ -e $HOME/$2 ]; then
    echo "${2}が既に存在します。置き換えますか?(yes or no)"
    read answer
    case "$answer" in
      yes)
        rm $HOME/$2
        ln -s $HOME/dotfiles/$1 $HOME/$2
        ;;
     *)
       echo '中断します。'
       ;;
    esac
  else
    echo "${2}のシンボリックリンクを作成します。"
    ln -s $HOME/dotfiles/$1 $HOME/$2
  fi
}

create_file 'vim/.vimrc' '.vimrc'
create_file '.zshrc' '.zshrc'
create_file '.gitconfig' '.gitconfig'
create_file '.bashrc' '.bashrc'
create_file '.tmux.conf' '.tmux.conf'

echo 'NeoBundleをインストールします。'
if [ ! -d $HOME/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
fi

if [ ! -d $HOME/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
else
  echo '既にNeoBundleがインストールされています。'
fi


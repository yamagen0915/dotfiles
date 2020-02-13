#!/bin/sh

cd `dirname $0`;

export DOTFILES_PATH=`pwd`

paths=(
  "${DOTFILES_PATH}/zsh/zshrc ${HOME}/.zshrc"
  "${DOTFILES_PATH}/git/gitconfig ${HOME}/.gitconfig"
  "${DOTFILES_PATH}/vim/vimrc ${HOME}/.vimrc"
  "${DOTFILES_PATH}/peco/config.json ${HOME}/.config/peco/config.json"
)

function main()
{
  for path in "${paths[@]}"; do
    p=(${path[@]})
    src=${p[0]}
    dst=${p[1]}

    if [ -e $dst ]; then
      mv $dst "${dst}.bk"
    fi

    ln -s $src $dst
  done

  echo "Please set \"export DOTFILES_PATH=`pwd`\" on your .zshrc.local"
}

main

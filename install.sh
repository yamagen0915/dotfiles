#!/bin/sh

cd `dirname $0`;

paths=(
  "`pwd`/zsh/zshrc ${HOME}/.zshrc"
  "`pwd`/git/gitconfig ${HOME}/.gitconfig"
  "`pwd`/vim/vimrc ${HOME}/.vimrc"
  "`pwd`/peco/config.json ${HOME}/.config/config.json"
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
}

main

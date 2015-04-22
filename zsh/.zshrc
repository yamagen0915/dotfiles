function load_file()
{
  if [ -f $1 ];then
    source $1
  fi
}

# OS別の設定ファイルを読み込む
case ${OSTYPE} in
  darwin*)
    load_file ~/dotfiles/zsh/mac/.zshrc
    ;;
  linux*)
    load_file ~/dotfiles/zsh/linux/.zshrc
    ;;
esac

# 共通設定を読み込む
load_file ~/dotfiles/zsh/.zshrc.options
load_file ~/dotfiles/zsh/.zshrc.alias
load_file ~/dotfiles/zsh/.zshrc.enviroment

# git-completetionのロード
fpath=(~/.zsh/contrib/completion/ $fpath)
autoload -U compinit
compinit -u

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# コマンドラインスタック
show_buffer_stack() {
  POSTDISPLAY="
  stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack

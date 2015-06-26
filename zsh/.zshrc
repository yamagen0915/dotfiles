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
load_file ~/dotfiles/zsh/zshrc.options
load_file ~/dotfiles/zsh/zshrc.alias
load_file ~/.zshrc.local

# git-completetionのロード
fpath=(~/.zsh/contrib/completion/ $fpath)
autoload -U compinit
compinit -u

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# プロンプト
PROMPT="[%*] [%~/]
%{${fg[cyan]}%}%n@%m $ %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}%1(v|%1v|)%{${reset_color}%}"

# コマンドラインスタック
show_buffer_stack() {
  POSTDISPLAY="
  stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack



# Source global definitions
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi


GIT_PS1_SHOWDIRTYSTATE=true
if [ -f /usr/local/src/git-1.9.0/contrib/completion/git-prompt.sh ]; then
  source /usr/local/src/git-1.9.0/contrib/completion/git-prompt.sh
fi

git_branch() {
  __git_ps1 ' (git:%s)'
}

# .git-completion.bash は git のブランチ名の補完などを行なってくれる。
# ファイルは /usr/share/doc/git-VERSION/cntrib/completion/ あるいは、ソースをダウンロードしてきて、 cntrib/completion/ にあるはず。
# 以下では、現在のブランチ名が表示されるようにしている。ついでに、色を変えたり、時間を表示させたりもしている。
if [ -f /usr/local/src/git-1.9.0/contrib/completion/git-completion.bash ]; then
  source /usr/local/src/git-1.9.0/contrib/completion/git-completion.bash
  if [ -r "$HOME/.git-completion.bash" ]; then
    PS1='\[\e[37;36m\]\u @ \[\e[37;36m\]\h [\[\e[37;36m\]\W] $(git_branch) $ \[\e[00m\]'
  else
    PS1='\[\e[37;36m\]\u @ \[\e[37;36m\]\h [\[\e[37;36m\]\W] $ \[\e[00m\]'
  fi
fi

# エイリアス
alias la='ls -laG'
alias ll='ls -lG'

alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias vi="vim"
alias g="git"


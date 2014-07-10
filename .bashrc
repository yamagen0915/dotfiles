
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /usr/local/src/git-1.9.0/contrib/completion/git-completion.bash
source /usr/local/src/git-1.9.0/contrib/completion/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\[\e[37;36m\]\u @ \[\e[37;36m\]\h [\[\e[37;36m\]\W] $(__git_ps1) $ \[\e[00m\]'
export PATH=$PATH:/usr/local/mysql/bin

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


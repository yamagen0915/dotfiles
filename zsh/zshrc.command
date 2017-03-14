
alias vi='vim'
alias view='vim -R'
alias g="git"
alias pd='popd'
alias reload='source ~/.zshrc'

alias la='ls -A'
alias ll='ls -la'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'

# tmuxが起動していない場合にalias設定を行う
if [ $SHLVL = 1 ]; then
  alias tmux="tmux -2 attach || tmux -2 new-session \; source-file ~/dotfiles/tmux/tmux.split"
fi

function today(){
  echo $(date +%Y%m%d)
}


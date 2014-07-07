
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /usr/local/src/git-1.9.0/contrib/completion/git-completion.bash
source /usr/local/src/git-1.9.0/contrib/completion/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\[\e[37;36m\]\u @ \[\e[37;36m\]\h [\[\e[37;36m\]\W] $(__git_ps1) $ \[\e[00m\]'
export PATH=$PATH:/usr/local/mysql/bin

export FOXDIE=/usr/local/projects/foxdie/current
export LOG_RECEIVER=/usr/local/projects/log_receiver/current

alias vi="vim"
alias vagrant="sudo su - vagrant"
alias rake="RAILS_ENV=development; bundle exec rake"
alias mysql="mysql --pager='less -S -F' -u root -p"

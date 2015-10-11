if [ -f ~/.bashrc_secrets ]; then
    . ~/.bashrc_secrets
fi

# Linux
export EDITOR=vim
export VISUAL=vim
source ~/bash_prompt.sh

# Python
export WORKON_HOME=~/.venv
source /usr/local/bin/virtualenvwrapper.sh

# Ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

# TMUX
alias tmux='tmux -2'
export TERM='xterm-256color'

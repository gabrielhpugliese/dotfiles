# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export TERM=xterm-256color
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export EDITOR=vim
export VISUAL=vim
export GREP_OPTIONS='--color=auto'

alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
alias gae_update='/usr/local/google_appengine/appcfg.py update .'
alias v='vim'
alias gv='gvim'
alias g='git'
alias p='python'
#alias ip='ipython'

alias ls='ls -F'
#alias cd=pushd
#alias bd=popd

if [ -d ~/.bin ]; then
	PATH="$PATH:~/.bin"
fi

if [ -s ~/.bash_prompt.sh ]; then
	. ~/.bash_prompt.sh
fi


export HISTSIZE=8000
export HISTFILESIZE=8000

export EC2_HOME=$HOME/.ec2
export AWS_AUTO_SCALING_HOME=$HOME/.autoscaling
export AWS_CLOUDWATCH_HOME=$HOME/.cloud-watch
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/
export PATH=$PATH:$EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_CLOUDWATCH_HOME/bin:$HOME/.ami/bin/


set -o vi
if [ `uname` = 'Darwin' ]; then
        PATH="/usr/local/share/python:$PATH"
        VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
fi
VENVWRAPPER_BIN='/usr/local/bin/virtualenvwrapper.sh'

if [[ -s $VENVWRAPPER_BIN ]]; then
    export WORKON_HOME=~/virtualenv
    source $VENVWRAPPER_BIN
fi

if [ -f ~/.bashrc_secret ]; then
    . ~/.bashrc_secret
fi

if [ -f ~/.bin/funcoeszz ]; then
    . ~/.bin/funcoeszz
fi


export COPYFILE_DISABLE=true


#export LANG="en_US.UTF-8"
#export LC_COLLATE="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"
#export LC_MESSAGES="en_US.UTF-8"
#export LC_MONETARY="en_US.UTF-8"
#export LC_NUMERIC="en_US.UTF-8"
#export LC_TIME="en_US.UTF-8"
#export LC_ALL=

alias mg="cd WorkPlace/mongu.ru.git/ ; vim"

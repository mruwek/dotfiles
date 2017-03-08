# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

## Set <C-S> free :)

if [[ $- == *i* ]]; then
    stty ixany
    stty ixoff -ixon
fi

## Essential variables

EDITOR="vim"
GPG_TTY=$(tty)				# needed by apps connecting with gpg-agent
BASH_COMPLETION_USER_DIR=~/.bash_completion.d

export EDITOR GPG_TTY BASH_COMPLETION_USER_DIR

## Turn Vi super-powers on
set -o vi

## History
HISTSIZE=100000
HISTCONTROL='ignoreboth:erasedups'

## powerline
if [[ $- == *i* ]]; then
    if [[ $TERM == 'linux' ]]; then
        setfont ~/.fonts/ter-powerline-v16v.psf.gz
    fi
    ~/.local/bin/powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . ~/.local/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh
fi

## Useful aliases
eval $(thefuck --alias)
alias ..='cd ..'
alias gpg='gpg2'
alias lss='ls -sS'
alias ls='ls -FhX --color=auto --group-directories-first'
alias l.='ls -d .*'
alias ll='ls -l'
alias la='ls -A'
alias enman="LANG='en_US.utf8' man" && complete -F _man -o filenames enman
alias forgetgpg='pkill -SIGHUP gpg-agent'
alias clearraw='for i in *.orf; do if [ ! -f ${i::-3}jpg ]; then rm $i; fi; done' 
alias smallnames='rename.pl tr/A-Z/a-z/ *'
alias extract_kindle_covers='python ~/varia/kundel/ExtractCoverThumbs-py.zip --skip-apnx'

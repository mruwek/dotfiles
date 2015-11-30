# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

## Set <C-S> free :)

if [[ $- == *i* ]]; then
    stty ixany
    stty ixoff -ixon
fi

## Essential variables

EDITOR="vim"
GPG_TTY=$(tty)				# needed by apps connecting with gpg-agent

export EDITOR GPG_TTY

## Turn Vi super-powers on
set -o vi

## History
HISTSIZE=100000
HISTCONTROL='ignoreboth:erasedups'

## base-16-shell
if [[ $- == *i* ]]; then
    if [ "$PS1" ]; then
        BASE16_SHELL="$HOME/.config/base16-shell/base16-atelierseaside.dark.sh"
        [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
    fi
fi

## Useful aliases
alias ..='cd ..'
alias gpg='gpg2'
alias lss='ls -sS'
alias ls='ls -FhX --color=auto --group-directories-first'
alias l.='ls -d .*'
alias ll='ls -l'
alias la='ls -A'
alias enman="LANG='en_US.utf8' man" && complete -F _man -o filenames enman
alias forgetgpg='pkill -SIGHUP gpg-agent'

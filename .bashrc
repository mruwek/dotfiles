# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

## Set <C-S> free :)

stty ixany
stty ixoff -ixon

## Essential variables

EDITOR="vim"
GPG_TTY=$(tty)				# needed by apps connecting with gpg-agent
HGEDITOR="hgeditor"

## Turn Vi super-powers on
set -o vi

## History
HISTSIZE=1000
HISTCONTROL='ignoreboth:erasedups'

## base-16-shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-atelierseaside.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

## Useful aliases
alias ..='cd ..'
alias gpg='gpg2'
alias lss='ls -sS'
alias ls='ls -FhX --color=auto --group-directories-first'
alias lss='ls -sS'
alias l.='ls -d .*'
alias ll='ls -l'
alias la='ls -A'
alias enman="LANG='en_US.utf8' man" && complete -F _man -o filenames enman
alias forgetgpg='pkill -SIGHUP gpg-agent'

## todo.sh
if [[ $TERM == "linux" ]]; then
    alias todo="todo.sh -d .todo/config-vte"
else
    alias todo="todo.sh"
fi
complete -F _todo todo

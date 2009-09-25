# Env
PATH="$PATH:~/bin"
LANG="pl_PL.utf8"
LC_COLLATE="C"
if	[ $TERM = 'xterm' ]; then
	TERM="xterm-256color"
fi
EDITOR="vim"
MANPAGER="vimmanpager"
GPG_TTY=$(tty)				# needed by apps connecting with gpg-agent
OOO_FORCE_DESKTOP="gnome"
export PATH LANG LC_COLLATE TERM EDITOR MANPAGER OOO_FORCE_DESKTOP GPG_TTY

# Bash hacks
## Prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$ \[\e[m\]\[\e[00m\]'

## Turn Vi super-powers on
set -o vi

## Completion in Gentoo
source /etc/profile.d/bash-completion.sh

## History
HISTSIZE=1000
HISTCONTROL='ignoreboth:erasedups'
HISTIGNORE='cd *:echo *:equery *:gpg --decrypt *:gpg --encrypt *:kilall *:ls:ls *:locate *:rm *:sh *'
export HISTSIZE HISCTCONTROL HISTIGNORE

# Useful aliases
alias ..='cd ..'
alias enman="LANG='en_US.utf8' man"
alias subdlen='subdl --output="%m_%L.%S" --lang="eng" --interactive'
alias subdlpl='subdl --output="%m_%L.%S" --lang="pol" --interactive'
alias mplayerfb='mplayer -vo fbdev -fs -zoom -x 1024 -y 576 -subfont-autoscale 1 -ass -ass-color ffffff00'
alias forgetgpg='pkill -SIGHUP gpg-agent'

# Finally, time for fun
echo 'Fortunka:'
fortune -cs
echo '------------------------------------------------------------------------------'

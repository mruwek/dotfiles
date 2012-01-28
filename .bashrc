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
HGEDITOR="hgeditor"
OOO_FORCE_DESKTOP="gnome"
export PATH LANG LC_COLLATE TERM EDITOR MANPAGER OOO_FORCE_DESKTOP HGEDITOR GPG_TTY

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
#HISTIGNORE='cd *:echo *:equery *:eix *:gpg --decrypt *:gpg --encrypt *:kilall *:ls:ls *:locate *:rm *:sh *'
export HISTSIZE HISCTCONTROL HISTIGNORE

# Useful aliases
alias ..='cd ..'
alias ls='ls -FhX --color=auto --group-directories-first'
alias lss='ls -sS'
alias ll='ls -l'
alias enman="LANG='en_US.utf8' man" && complete -F _man -o filenames enman
alias subdlen='subdl --output="%m_%L.%S" --lang="eng" --interactive'
alias subdlpl='subdl --output="%m_%L.%S" --lang="pol" --interactive'
if [[ $TERM == 'linux' ]]; then
    alias mplayer='mplayer -vo fbdev -fs -zoom -x 1024 -y 768 -subfont-autoscale 1 -ass -ass-color ffffff00'
fi
alias forgetgpg='pkill -SIGHUP gpg-agent'
alias bzip2='bzip2 --progress'
if [[ -z $DISPLAY ]]; then
    alias cclive="cclive --stream-exec='mplayer -vo fbdev -fs -zoom -x 1024 -y 768 %i'"
fi
alias muttoff='mutt -F ~/.muttrc.off -y'

function fname2titleTag() {
    for i in *.mp3; do
        id3v2 -t "`echo $i | sed 's/..-\(.*\)\.mp3/\1/' | sed 's/_/ /g'`" $i;
    done
}

function fname2trackNumTag() {
    for i in *.mp3; do
        id3v2 -T ${i:0:2} $i;
    done
}

function stripId3Tags() {
    for i in *.mp3; do
        id3v2 -D $i;
    done
}

# Finally, time for fun
if [[ $- == *i* ]]; then
    echo '------------------------------------Fortunka-----------------------------------'
    fortune -s /usr/share/fortune/somefortune
    echo '-------------------------------------------------------------------------------'
fi

# .bash_profile

if [ $TERM == "linux" ]; then
    setfont ter-216n
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cabal/bin

export PATH

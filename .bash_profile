gpgagent="`which gpg-agent 2>/dev/null`"
if [ -n "$gpgagent" ] && [ -x "$gpgagent" ] && [ -z "$GPG_AGENT_INFO" ] && [ -d "$HOME/.gnupg" ]; then
    if ! test -r "$HOME"/.gpg-agent-info || 
        ! kill -0 $(cut -d: -f 2 "$HOME"/.gpg-agent-info) 2>/dev/null
    then
        # should I add --batch option ?
        "$gpgagent" --daemon --write-env-file "$HOME"/.gpg-agent-info &> /dev/null
    fi
    GPG_AGENT_INFO=$(cut -d= -f 2- "$HOME"/.gpg-agent-info) 2>/dev/null
    export GPG_AGENT_INFO
fi

# load .bashrc
. ~/.bashrc

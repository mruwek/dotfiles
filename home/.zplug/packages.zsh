zplug "plugins/history", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "RobSis/zsh-completion-generator"
zplug "iamthememory/homesick-zsh-completion"
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "k4rthik/git-cal", as:command
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
zplug "Ajnasz/oh-my-zsh", use:"plugins/topydo"

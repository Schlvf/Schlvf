# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sch/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

export PATH="$HOME/.local/bin:$PATH"

# zsh setups used in interactive shells

export EDITOR="/Applications/Aquamacs.app/Contents/MacOS/bin/emacsclient  "

# aliases should be the same as they are simple
source $HOME/.bash_aliases


if  command -v starship &> /dev/null
then
    eval "$(starship init zsh)"
fi


if test -e "${HOME}/.iterm2_shell_integration.zsh"; then
    set +u
    source "${HOME}/.iterm2_shell_integration.zsh"
fi

HISTSIZE=2000
SAVEHIST=1000
HISTFILE=~/.local/zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS


setopt AUTO_CD
setopt CHASE_LINKS
setopt PUSHD_IGNORE_DUPS

setopt NO_CLOBBER
setopt APPEND_CREATE
setopt INTERACTIVE_COMMENTS

#probably should do a more generic one using zkbd
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

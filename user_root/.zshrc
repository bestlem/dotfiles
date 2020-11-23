# zsh setups used in interactive shells

export EDITOR="/Applications/Aquamacs.app/Contents/MacOS/bin/emacsclient  "

# aliases should be the same as they are simple
source $HOME/.bash_aliases

eval "$(starship init zsh)"

if test -e "${HOME}/.iterm2_shell_integration.zsh"; then
    set +u
    source "${HOME}/.iterm2_shell_integration.zsh"
fi

# -*- mode: sh;-*-

# called on login or interactively

# some from http://dotfiles.org/~bogojoker/.bashrc
# and http://tldp.org/LDP/abs/html/sample-bashrc.html



DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"



if [ -f $DIR/.bashrc ]; then
   source $DIR/.bashrc
fi

#test if interactive
if [ -n "${PS1:-}" ]; then
    source $DIR/.bash_aliases
fi

if test -e "${HOME}/.iterm2_shell_integration.bash"; then
    set +u
    source "${HOME}/.iterm2_shell_integration.bash"
fi

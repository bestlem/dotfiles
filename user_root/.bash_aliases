# -*- mode: sh;-*-

#aliases in bash and zsh

# -----------
#   General Aliases
# -----------
alias ..='cd ..'
alias ll='ls -l'
alias lr='ls -alrt'
alias la='ls -lA'
alias l='ls -F'
alias psu='ps -auxwww'
alias du='du -kh'       # Makes a more readable output.
alias df='df -kh'
alias cd..='cd ..'
alias printenv='env | sort'
alias man='openman'

alias e='/Applications/Aquamacs.app/Contents/MacOS/bin/emacsclient'


alias mkdir='mkdir -p'
alias today='date +"%A, %B %d, %Y"'
alias yest='date -v-1d +"%A %B %d, %Y"'
alias recent='ls -lAt | head'

# -------
#   Git
# -------
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias github="open \`gitonfig -l | grep 'remote.origin.url' | sed -En 's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"


# -------
#   Typos
# -------
alias alisa='alias'
alias xs='cd'



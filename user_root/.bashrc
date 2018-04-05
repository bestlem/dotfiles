#!/usr/bin/bash
# -*- mode: sh;-*-

# standard used by all bash logins

# some from http://dotfiles.org/~bogojoker/.bashrc
# and http://tldp.org/LDP/abs/html/sample-bashrc.html

#-------------------------------------------------------------
# Some settings
#-------------------------------------------------------------

#ulimit -S -c 0          # Don't want any coredumps.
set -o notify
set -o noclobber
set -o ignoreeof
set -o nounset
#set -o xtrace          # Useful for debuging.

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob        # Necessary for programmable completion.


# ---------------
#   Environment
# ---------------
export HISTSIZE=10000
export HISTFILESIZE=10000
export PAGER=less
#export CLICOLOR=1
export EDITOR="/Applications/Aquamacs.app/Contents/MacOS/bin/emacsclient  "


# Cool History Summerizer
historyawk(){ history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head; }

export PATH=~/bin:/usr/local/bin:/opt/local/bin:$PATH


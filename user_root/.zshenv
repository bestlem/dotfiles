# zsh setups used in all shells

export PATH=~/bin:/usr/local/bin:/opt/local/bin:$PATH


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mark/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mark/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mark/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mark/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


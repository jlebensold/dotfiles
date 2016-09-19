# -*- sh -*-

# Read by login shells only (the first time you log in).
# NOT read by subshells (like what screen creates).

source $HOME/.bash/better-paths
# source ~/.git-prompt.sh

# .bashrc is read by subshells. This will make login shells read it too.
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

#KevinHacks
# . ~/Projects/dotfiles/bash_colors.sh

# Unbreak broken, non-colored terminal
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# Git prompt components
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}
grb_git_prompt() {
    local g=`__git_ps1`
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="$(minutes_since_last_commit)m"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(${SINCE_LAST_COMMIT}|%s)"`
        echo ${GIT_PROMPT}
    fi
}

#PS1="${CYAN}\h${NORMAL}:\W\$(grb_git_prompt) \u\$ "
PS1="\h:\W\$(grb_git_prompt) \u\$ "

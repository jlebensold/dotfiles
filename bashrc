# -*- sh -*-

# This is read by subshells. Login shells source this file via .bash_profile
#
# Set aliases in ~/.bash/aliases
# Set prompts and whatnot in ~/.bash/config
# Set prompts in ~/.bash/paths
#
# Don't set PATH here because it'll keep growing.  Source paths in bash_profile

# These don't carry through to subshells so they go here instead of
# .bash_profile

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/config
source ~/.bash/colorfixes

# Use .localrc for settings specific to one system.
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

# RVM comes last
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:/Users/jon/.rvm/bin # Add RVM to PATH for scripting

export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion


#if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
#  GIT_PROMPT_THEME=Default
#  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
#fi
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:/usr/local/include:/usr/local/lib:/usr/local/bin

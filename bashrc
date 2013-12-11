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

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export JRUBY_OPTS="-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF"    


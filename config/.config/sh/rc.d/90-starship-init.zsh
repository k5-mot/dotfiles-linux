#!/usr/bin/env zsh

##
## Starship
##

if command -v "starship" &> /dev/null; then
  # export PATH=$PATH:$XDG_CACHE_HOME/starship
  # echo "Starship loaded"
  eval "$(starship init zsh)"
fi

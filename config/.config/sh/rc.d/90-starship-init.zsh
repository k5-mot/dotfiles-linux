#!/usr/bin/env zsh

##
## Starship
##

# if command -v "starship" &> /dev/null; then
if [ -x "$(command -v starship)" ]; then
  # export PATH=$PATH:$XDG_CACHE_HOME/starship
  eval "$(starship init zsh)"
fi

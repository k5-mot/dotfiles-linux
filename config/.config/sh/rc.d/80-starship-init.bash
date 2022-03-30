#!/usr/bin/env bash

##
## Starship
##
if [ -x $XDG_CACHE_HOME/starship/starship ]; then
  export PATH=$PATH:$XDG_CACHE_HOME/starship
  eval "$(starship init bash)"
fi
